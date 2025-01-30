The following SQL query contains a subtle error that can lead to unexpected results or even crashes, depending on the database system and data characteristics:

```sql
SELECT column1, column2 FROM table1 WHERE column3 = 'someValue' AND column4 LIKE '%pattern%';
```

The issue lies in the combination of `=` and `LIKE` operators within the `WHERE` clause. If the database system evaluates the `LIKE` condition first, and it returns a large number of rows, it can lead to a performance bottleneck or even resource exhaustion before reaching the `=` operator.  This is especially pronounced if `table1` is a very large table.

The problem is exacerbated when using wildcard characters `%` at the beginning of the pattern in `LIKE '%pattern%'`, causing full-table scans in most database systems unless a specific index is designed to handle such patterns efficiently.

This behavior is not always consistent across different database systems. Some might optimize the query differently, while others may produce different error messages or unexpected outcomes.