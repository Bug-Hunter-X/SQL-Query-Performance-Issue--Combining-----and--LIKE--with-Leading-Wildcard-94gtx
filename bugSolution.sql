Several solutions can address this performance issue, depending on the specific database system and indexing strategy. Here are a few:

**1. Re-ordering the conditions:** In some cases, simply re-ordering the conditions in the `WHERE` clause can improve performance.  If the `=` condition filters the data significantly, putting it first might reduce the number of rows to be processed by the `LIKE` condition.

```sql
SELECT column1, column2 FROM table1 WHERE column4 LIKE '%pattern%' AND column3 = 'someValue';
```

**2. Creating or using an index:** The most effective solution usually involves indexing the appropriate columns. A proper index on `column3` will allow for quick lookups and can significantly reduce the search space. If possible, create a full-text index on `column4` to optimize `LIKE` searches with leading wildcards, although this might not be feasible for all database systems.

**3. Full-text search functions:** Use the database's built-in full-text search functionalities for more effective searching of large text columns. This often provides optimized search capabilities and might outperform using `LIKE` with leading wildcards.

**4. Subquery:** Use a subquery to pre-filter the data based on the `=` condition, reducing the number of rows for the `LIKE` condition to process.

```sql
SELECT column1, column2
FROM (SELECT column1, column2, column4 FROM table1 WHERE column3 = 'someValue') AS subquery
WHERE column4 LIKE '%pattern%';
```

The best approach will depend on specific database characteristics, data volume, and indexing strategy.  Profiling and benchmarking different versions are recommended for determining optimal performance.