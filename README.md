This project is related to a Udacity course: [Intro to Relational Databases](https://www.udacity.com/course/intro-to-relational-databases--ud197)

To run, clone repo to local machine. In a terminal run `vagrant up` and `vagrant ssh`. cd into /vagrant/tournament

Run `psql` and `\i tournament.sql`. This will drop any existing database named tournament and attempt to create a new one with the necessary tables and views.

This is what my own terminal looked like:

```
vagrant@vagrant-ubuntu-trusty-32:/vagrant/tournament$ psql
psql (9.3.10)
Type "help" for help.

vagrant=> \i tournament.sql
DROP DATABASE
CREATE DATABASE
You are now connected to database "tournament" as user "vagrant".
psql:tournament.sql:15: ERROR:  view "standings" does not exist
psql:tournament.sql:16: ERROR:  table "matches" does not exist
psql:tournament.sql:17: ERROR:  table "players" does not exist
CREATE TABLE
CREATE TABLE
CREATE VIEW
tournament=> \q
```

Afterwards, run `\q` to quit psql. Run tests with `python tournament_test.py`.

These were my test results:

```
vagrant@vagrant-ubuntu-trusty-32:/vagrant/tournament$ python tournament_test.py
1. Old matches can be deleted.
2. Player records can be deleted.
3. After deleting, countPlayers() returns zero.
4. After registering a player, countPlayers() returns 1.
5. Players can be registered and deleted.
6. Newly registered players appear in the standings with no matches.
7. After a match, players have updated standings.
8. After one match, players with one win are paired.
Success!  All tests pass!
```
