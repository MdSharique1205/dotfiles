#!/sbin/python3
import sys

import requests

URL = " https://codeforces.com/api/user.status?handle=Sharique1"

RATINGS = [
    800,
    900,
    1000,
    1100,
    1200,
    1300,
    1400,
    1500,
    1600,
    1700,
    1800,
    1900,
    2000,
    2100,
    2200,
    2300,
    2400,
    2500,
    2600,
    2700,
    2800,
    2900,
    3000,
]


def fetch_count(count):
    "Function to fetch problems solve for each rating"
    try:
        res = requests.get(URL)
        if not res.ok:
            print("API DOWN")
            sys.exit()
        res_json = res.json()

        for x in RATINGS:
            count[x] = 0

        s = set()
        for x in res_json["result"]:
            problemID = str(x['problem']['contestId']) + str(x['problem']['index'])
            if(problemID not in s): 
                s.add(problemID)
                rating = x["problem"].get("rating", None)
                verdict = "OK" == x.get("verdict", "")
                if rating and verdict:
                    count[rating] += 1
    except Exception as e:
        print("ERROR")
        sys.exit()


def range_count(count, left, right):
    """
    Function to calculate solved questions within the rating
    range: [left, right]
    """
    solved = 0
    for x in count.keys():
        if left <= x <= right:
            solved += count[x]
    return solved


def main():
    "Main module"
    count = {}
    fetch_count(count)
    solved = range_count(count, int(sys.argv[1]), int(sys.argv[2]))
    print(solved)


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print(-1)
        sys.exit()
    main()
