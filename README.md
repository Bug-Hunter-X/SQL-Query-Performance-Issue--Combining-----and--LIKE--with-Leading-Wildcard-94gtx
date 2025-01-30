# SQL Query Performance Issue: Combining '=' and 'LIKE' with Leading Wildcard

This repository demonstrates a subtle SQL query performance issue arising from the combined use of `=` and `LIKE` operators in the `WHERE` clause, particularly when the `LIKE` pattern begins with a wildcard character (`%`).

## Problem Description

The query below, seemingly straightforward, can lead to significant performance degradation or even crashes in certain scenarios:

```sql
SELECT column1, column2 FROM table1 WHERE column3 = 'someValue' AND column4 LIKE '%pattern%';
```

The problem lies in the order of evaluation and the impact of the wildcard at the beginning of the `LIKE` pattern. If the database evaluates `LIKE` first, and a large number of rows match the pattern, it can consume substantial resources before applying the `=` condition, potentially causing significant delays or failures.

## Solution

The solution focuses on re-writing the query to improve efficiency and eliminate the potential for performance issues.  This often involves changing the query structure to make better use of indexes.

See `bugSolution.sql` for an improved version.

## Contributing

Contributions are welcome!