#!/sbin/python3
import sys
import datetime
import requests

URL = " https://codeforces.com/api/user.status?handle=Sharique1"

POINTS = {1: [1500, 1800], 2: [1900, 2099], 3: [2100, 2399]}

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


def fetch_count(count, days=7):
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
            solved_at = datetime.datetime.now() - datetime.datetime.fromtimestamp(
                int(x["creationTimeSeconds"])
            )
            monday = datetime.datetime.now() - datetime.timedelta(
                days=datetime.datetime.now().weekday()
            )
            solved_at = (
                datetime.datetime.fromtimestamp(int(x["creationTimeSeconds"])) - monday
            )
            if solved_at.days >= 0 and solved_at.days < 7:
                # if(solved_at.days < 7):
                # print(solved_at)
                # sys.exit()
                problemID = str(x["problem"]["contestId"]) + str(x["problem"]["index"])
                if problemID not in s:
                    s.add(problemID)
                    rating = x["problem"].get("rating", None)
                    verdict = "OK" == x.get("verdict", "")
                    if rating and verdict:
                        count[rating] += 1
    except Exception as e:
        print(e)
        print("ERROR")
        sys.exit()


def solved(count, left, right):
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
    points = 0
    for key, val in POINTS.items():
        points += key * solved(count, val[0], val[1])
    print(points)


if __name__ == "__main__":
    main()
