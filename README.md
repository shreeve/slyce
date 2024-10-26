# slyce

Ruby utility to show summary statistics or export data from MySQL, SQLite, or DuckDB.

## TODO

* Unify each each executable to have as close to the same features as possible

## Usage

```
usage: slyce [options] <database> <table>
        --csv                        Output comma separated values
        --psv                        Output pipe separated values
        --tsv                        Output tab separated values
    -a, --ascii                      Convert data to ASCII using AnyAscii
    -c, --columns                    Display column names and quit
    -h, --help                       Show help and command usage
    -H, --headerless                 Do not show headers when exporting delimited files
    -n, --natural                    Sort naturally, not numerically
    -s, --show <count>               Show this many values
    -t, --tables                     Display table names and quit
    -v, --version                    Show version number
    -w, --where <cond>               Where clause (eg - 'age>50 and state='AZ')
    -x, --extract <col1,col2,...>    Comma separated list of columns to extract
```

## Supported platforms

### MySQL

The executable is called `slyce`.

### SQLite

The executable is called `slyce3` and requires the `regexp` sqlite3 extension from https://github.com/nalgeon/sqlean

You can download the latest version at: https://github.com/nalgeon/sqlean/releases/latest

For example, on Apple Silicon with macOS with an M1 you can use:

```
wget https://github.com/nalgeon/sqlean/releases/download/0.19.3/sqlean-macos-arm64.zip
unzip sqlean-macos-arm64.zip regexp.dylib
```

### DuckDB

The executable is called `slyced`. It requires the `duckdb` gem, which can be installed with:

```gem install duckdb```

## Example

The following will open `my-database.duck` and will export the first 10 rows
with the `last_name` field equal to `Miller` and it will extract six fields
starting with `id,first_name,...`. The output will be a `csv` file to `STDOUT`.

```slyced my-database.duck members -r 10 -w "last_name='Miller'" -xid,first_name,city,state,zip,medical_plan --csv```

The following will show the most frequent 5 values from the `temp_table` table
in the `nearsite` database for these fields: `ef_id,external_id,insurance_plan`.
In addition, only rows with the condition specified in the `-w` option are shown.

```slyce nearsite temp_table -s 10 -w "ef_id>=251 and benefit_status='X'" -x ef_id,external_id,insurance_plan -r 5```

The resulting table looks like:

```text
    ef_id
    =====
781 255
 35 253
 31 510
 19 251
  5 258
    -----
871 shown (top 5)
879 total (all 10)

    external_id
    ===========
816 NULL
  1 1235
  1 1266
  1 1320
  1 1548
    -----
820 shown (top 5)
879 total (all 64)

    insurance_plan
    ==============
176 Aetna PPO
144 Aetna HSA
103 NULL
 82 Kaiser Northern CA
 73
    -----
578 shown (top 5)
879 total (all 35)
```
