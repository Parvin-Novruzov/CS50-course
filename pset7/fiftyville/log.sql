-- Keep a log of any SQL queries you execute as you solve the mystery.

SELECT *
FROM crime_scene_reports
where day = 28 and
	year = 2020 and
    month = 7 AND
    street = "Chamberlin Street";
    --used query to find discription of crime
    --Theft of the CS50 duck took place at 10:15am at the Chamberlin Street courthouse.
    --Interviews were conducted today with three witnesses who were present at the time — each of their interview transcripts mentions the courthouse.
   SELECT *
FROM interviews
where day = 28 and
	year = 2020 and
    month = 7;
    --Ruth | 2020 | 7 | 28 | Sometime within ten minutes of the theft, I saw the thief get into a car in the courthouse parking lot and drive away.
    --If you have security footage from the courthouse parking lot, you might want to look for cars that left the parking lot in that time frame.
--162 | Eugene | 2020 | 7 | 28 | I don't know the thief's name, but it was someone I recognized.
--Earlier this morning, before I arrived at the courthouse, I was walking by the ATM on Fifer Street and saw the thief there withdrawing some money.
--163 | Raymond | 2020 | 7 | 28 | As the thief was leaving the courthouse, they called someone who talked to them for less than a minute.
--In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow.
--The thief then asked the person on the other end of the phone to purchase the flight ticket.
--sqlite>
SELECT *
   ...> FROM flights
   ...> where year = 2020 and month = 7 and day = 29
   ...> order by hour, minute asc;
id | origin_airport_id | destination_airport_id | year | month | day | hour | minute
36 | 8 | 4 | 2020 | 7 | 29 | 8 | 20
43 | 8 | 1 | 2020 | 7 | 29 | 9 | 30
23 | 8 | 11 | 2020 | 7 | 29 | 12 | 15
53 | 8 | 9 | 2020 | 7 | 29 | 15 | 20
18 | 8 | 6 | 2020 | 7 | 29 | 16 | 0
--we know the thief is going to destination airport four
select * from airports where id  = 4;
Error: near "select": syntax error
sqlite>  select * from airports where id = 4;
id | abbreviation | full_name | city
4 | LHR | Heathrow Airport | London
sqlite>
--we know they went to London
select * from atm_transactions where day = 28  and month = 7 and year = 2020;
id | account_number | year | month | day | atm_location | transaction_type | amount
245 | 90209473 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 45
246 | 28500762 | 2020 | 7 | 28 | Fifer Street | withdraw | 48
247 | 41935128 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 15
248 | 94973060 | 2020 | 7 | 28 | Humphrey Lane | deposit | 50
249 | 21004503 | 2020 | 7 | 28 | Blumberg Boulevard | deposit | 40
250 | 45468795 | 2020 | 7 | 28 | Carvalho Road | withdraw | 15
251 | 57029719 | 2020 | 7 | 28 | Carvalho Road | withdraw | 80
252 | 93622979 | 2020 | 7 | 28 | Blumberg Boulevard | deposit | 15
253 | 66454844 | 2020 | 7 | 28 | Carvalho Road | withdraw | 60
254 | 16113845 | 2020 | 7 | 28 | Daboin Sanchez Drive | withdraw | 55
255 | 66344537 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 55
256 | 97773635 | 2020 | 7 | 28 | Carvalho Road | withdraw | 85
257 | 45096649 | 2020 | 7 | 28 | Blumberg Boulevard | deposit | 65
258 | 92647903 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 5
259 | 85274751 | 2020 | 7 | 28 | Humphrey Lane | deposit | 70
260 | 99835463 | 2020 | 7 | 28 | Daboin Sanchez Drive | withdraw | 40
261 | 67735369 | 2020 | 7 | 28 | Daboin Sanchez Drive | withdraw | 20
262 | 40665580 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 35
263 | 19531272 | 2020 | 7 | 28 | Blumberg Boulevard | withdraw | 55
264 | 28296815 | 2020 | 7 | 28 | Fifer Street | withdraw | 20
265 | 96336648 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 20
266 | 76054385 | 2020 | 7 | 28 | Fifer Street | withdraw | 60
267 | 49610011 | 2020 | 7 | 28 | Fifer Street | withdraw | 50
268 | 92206742 | 2020 | 7 | 28 | Blumberg Boulevard | withdraw | 30
269 | 16153065 | 2020 | 7 | 28 | Fifer Street | withdraw | 80
270 | 24133830 | 2020 | 7 | 28 | Carvalho Road | deposit | 5
271 | 20774848 | 2020 | 7 | 28 | Daboin Sanchez Drive | withdraw | 40
272 | 21656307 | 2020 | 7 | 28 | Daboin Sanchez Drive | withdraw | 10
273 | 69638157 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 20
274 | 27952274 | 2020 | 7 | 28 | Humphrey Lane | deposit | 95
275 | 86363979 | 2020 | 7 | 28 | Fifer Street | deposit | 10
276 | 13156006 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 15
277 | 89843009 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 40
278 | 69278040 | 2020 | 7 | 28 | Carvalho Road | withdraw | 45
279 | 98353484 | 2020 | 7 | 28 | Daboin Sanchez Drive | deposit | 95
280 | 92647903 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 40
281 | 57022441 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 55
282 | 32179718 | 2020 | 7 | 28 | Daboin Sanchez Drive | deposit | 20
283 | 75571594 | 2020 | 7 | 28 | Blumberg Boulevard | withdraw | 40
284 | 32212020 | 2020 | 7 | 28 | Humphrey Lane | deposit | 20
285 | 71305903 | 2020 | 7 | 28 | Carvalho Road | deposit | 35
286 | 16654966 | 2020 | 7 | 28 | Daboin Sanchez Drive | withdraw | 100
287 | 38010758 | 2020 | 7 | 28 | Humphrey Lane | deposit | 85
288 | 25506511 | 2020 | 7 | 28 | Fifer Street | withdraw | 20
289 | 62690806 | 2020 | 7 | 28 | Carvalho Road | withdraw | 45
290 | 79165736 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 5
291 | 76849114 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 10
292 | 56171033 | 2020 | 7 | 28 | Daboin Sanchez Drive | deposit | 70
293 | 27482737 | 2020 | 7 | 28 | Carvalho Road | deposit | 85
294 | 66254725 | 2020 | 7 | 28 | Carvalho Road | withdraw | 70
295 | 74812642 | 2020 | 7 | 28 | Blumberg Boulevard | withdraw | 60
296 | 96352349 | 2020 | 7 | 28 | Humphrey Lane | deposit | 10
297 | 26017967 | 2020 | 7 | 28 | Daboin Sanchez Drive | deposit | 85
298 | 70992522 | 2020 | 7 | 28 | Daboin Sanchez Drive | withdraw | 25
299 | 37543139 | 2020 | 7 | 28 | Daboin Sanchez Drive | deposit | 85
300 | 66344537 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 60
301 | 55656186 | 2020 | 7 | 28 | Carvalho Road | withdraw | 95
302 | 50380485 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 100
303 | 54824866 | 2020 | 7 | 28 | Blumberg Boulevard | deposit | 15
304 | 26249951 | 2020 | 7 | 28 | Carvalho Road | deposit | 70
305 | 93401152 | 2020 | 7 | 28 | Daboin Sanchez Drive | withdraw | 65
306 | 34939061 | 2020 | 7 | 28 | Humphrey Lane | deposit | 10
307 | 24064261 | 2020 | 7 | 28 | Daboin Sanchez Drive | deposit | 25
308 | 69638157 | 2020 | 7 | 28 | Humphrey Lane | deposit | 85
309 | 46222318 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 60
310 | 58673910 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 10
311 | 95773068 | 2020 | 7 | 28 | Humphrey Lane | deposit | 70
312 | 93903397 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 35
313 | 81061156 | 2020 | 7 | 28 | Fifer Street | withdraw | 30
314 | 73183211 | 2020 | 7 | 28 | Blumberg Boulevard | deposit | 80
315 | 79127781 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 65
316 | 95773068 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 45
317 | 11605357 | 2020 | 7 | 28 | Blumberg Boulevard | deposit | 40
318 | 40981669 | 2020 | 7 | 28 | Carvalho Road | deposit | 85
319 | 57022441 | 2020 | 7 | 28 | Daboin Sanchez Drive | withdraw | 85
320 | 15452229 | 2020 | 7 | 28 | Blumberg Boulevard | withdraw | 25
321 | 40231842 | 2020 | 7 | 28 | Carvalho Road | withdraw | 5
322 | 26797365 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 35
323 | 18363023 | 2020 | 7 | 28 | Blumberg Boulevard | deposit | 5
324 | 13156006 | 2020 | 7 | 28 | Humphrey Lane | deposit | 15
325 | 87859883 | 2020 | 7 | 28 | Daboin Sanchez Drive | withdraw | 5
326 | 91814087 | 2020 | 7 | 28 | Daboin Sanchez Drive | deposit | 45
327 | 40665580 | 2020 | 7 | 28 | Daboin Sanchez Drive | withdraw | 65
328 | 47306903 | 2020 | 7 | 28 | Daboin Sanchez Drive | withdraw | 90
329 | 34939061 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 100
330 | 26191313 | 2020 | 7 | 28 | Daboin Sanchez Drive | withdraw | 90
331 | 59116006 | 2020 | 7 | 28 | Carvalho Road | withdraw | 40
332 | 96352349 | 2020 | 7 | 28 | Carvalho Road | deposit | 65
333 | 65190958 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 50
334 | 99031604 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 20
335 | 32134232 | 2020 | 7 | 28 | Humphrey Lane | deposit | 70
336 | 26013199 | 2020 | 7 | 28 | Fifer Street | withdraw | 35
337 | 58552019 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 30
338 | 17171330 | 2020 | 7 | 28 | Blumberg Boulevard | withdraw | 15
339 | 14180174 | 2020 | 7 | 28 | Carvalho Road | withdraw | 95
340 | 86850293 | 2020 | 7 | 28 | Blumberg Boulevard | deposit | 60
341 | 97338436 | 2020 | 7 | 28 | Carvalho Road | withdraw | 60
342 | 55322348 | 2020 | 7 | 28 | Humphrey Lane | withdraw | 5
sqlite>
-- we know account number is 28500762
select * from bank_accounts inner join people on person_id = id where account_number = 28500762;
account_number | person_id | creation_year | id | name | phone_number | passport_number | license_plate
28500762 | 467400 | 2014 | 467400 | Danielle | (389) 555-5198 | 8496433585 | 4328GD8
--we know the thief is Danielle
260 | 2020 | 7 | 28 | 10 | 16 | exit | 5P2BI95
261 | 2020 | 7 | 28 | 10 | 18 | exit | 94KL13X
262 | 2020 | 7 | 28 | 10 | 18 | exit | 6P58WS2
263 | 2020 | 7 | 28 | 10 | 19 | exit | 4328GD8
264 | 2020 | 7 | 28 | 10 | 20 | exit | G412CB7
265 | 2020 | 7 | 28 | 10 | 21 | exit | L93JTIZ
266 | 2020 | 7 | 28 | 10 | 23 | exit | 322W7JE
267 | 2020 | 7 | 28 | 10 | 23 | exit | 0NTHK55
--we know escape vehicle
 ourthouse_security_logs.license_plate where day = 28 and month = 7 and year = 2020 and hour = 10 and minute >= 15 and minute < 25 and activity = "exit";
name
Patrick
Ernest
Amber
Danielle
Roger
Elizabeth
Russell
Evelyn
sqlite>
-- All these people left exeting courhouse
 SELECT
   ...>     DISTINCT name
   ...> FROM
   ...>     people
   ...>     JOIN bank_accounts ON people.id = bank_accounts.person_id
   ...>     JOIN atm_transactions ON bank_accounts.account_number = atm_transactions.account_number
   ...> WHERE
   ...>     day = "28"
   ...>     AND month = "7"
   ...>     AND year = "2020"
   ...>     AND transaction_type = "withdraw"
   ...>     AND atm_location = "Fifer Street";
name
Danielle
Bobby
Madison
Ernest
Roy
Elizabeth
Victoria
Russell
sqlite>
--we know one of these people Ernest,Elizabeth,Russell,Danielle
select name from people join phone_calls on people.phone_number = phone_calls.caller where day = 28 and month = 7 and year = 2020 and duration < 60;
name
Roger
Evelyn
Ernest
Evelyn
Madison
Russell
Kimberly
Bobby
Victoria
--we know cupple of people Roger,Evelyn,Ernest,Evelyn,Madison,Russell,Kimberly,Bobby,Victoria
SELECT
   ...>     name
   ...> FROM
   ...>     people
   ...>     JOIN passengers ON people.passport_number = passengers.passport_number
   ...> WHERE
   ...>     flight_id = (
   ...>         SELECT
   ...>             id
   ...>         FROM
   ...>             flights
   ...>         WHERE
   ...>             day = "29"
   ...>             AND month = "7"
   ...>             AND year = "2020"
   ...>         ORDER BY
   ...>             hour,
   ...>             minute
   ...>         LIMIT
   ...>             1
   ...>     )
   ...> INTERSECT
   ...> SELECT
   ...>     DISTINCT name
   ...> FROM
   ...>     people
   ...>     JOIN bank_accounts ON people.id = bank_accounts.person_id
   ...>     JOIN atm_transactions ON bank_accounts.account_number = atm_transactions.account_number
   ...> WHERE
   ...>     day = "28"
   ...>     AND month = "7"
   ...>     AND year = "2020"
   ...>     AND transaction_type = "withdraw"
   ...>     AND atm_location = "Fifer Street"
   ...> INTERSECT
   ...> SELECT
   ...>     name
   ...> FROM
   ...>     people
   ...>     JOIN phone_calls ON people.phone_number = phone_calls.caller
   ...> WHERE
   ...>     day = "28"
   ...>     AND month = "7"
   ...>     AND year = "2020"
   ...>     AND duration < "60"
   ...> INTERSECT
   ...> SELECT
   ...>     name
   ...> FROM
   ...>     people
   ...>     JOIN courthouse_security_logs ON people.license_plate = courthouse_security_logs.license_plate
   ...> WHERE
   ...>     day = "28"
   ...>     AND month = "7"
   ...>     AND year = "2020"
   ...>     AND hour = "10"
   ...>     AND minute >= "15"
   ...>     AND minute < "25"
   ...>     AND activity = "exit";
name
Ernest
-- we know the thief is Ernest,becouse he is the only one left after runing in intersect
SELECT * 
   ...> FROM phone_calls
   ...> INNER join people
   ...> on people.phone_number = phone_calls.caller
   ...> where name="Ernest"
   ...> and year = 2020
   ...>     and month = 7
   ...>     and day = 28
   ...>     and duration < 60;
id | caller | receiver | year | month | day | duration | id | name | phone_number | passport_number | license_plate
233 | (367) 555-5533 | (375) 555-8161 | 2020 | 7 | 28 | 45 | 686048 | Ernest | (367) 555-5533 | 5773159633 | 94KL13X
sqlite> 
--we know the ACCOMPLICE'S number is (375) 555-8161