(*
	Will Hauber
	Homework 1
	01/15/2016
	
	Hauber_hw1.sml
*)

(*
	Date: (year, month, day)
*)

fun is_older(firstDate : int*int*int, secondDate : int*int*int) =
	if #1 firstDate < #1 secondDate
	then true
	else if #1 firstDate > #1 secondDate
	then false
	else if #2 firstDate < #2 secondDate
	then true
	else if #2 firstDate > #2 secondDate
	then false
	else if #3 firstDate < #3 secondDate
	then true
	else if #3 firstDate > #3 secondDate
	then false
	else false

fun number_in_month(dates : (int*int*int) list, month : int) =
	if null dates
	then 0
	else if month = #2 (hd(dates))
	then 1 + number_in_month(tl(dates), month)
	else number_in_month(tl(dates), month)
	
fun number_in_months(dates : (int*int*int) list, months : int list) =
	if null dates
	then 0
	else if null months
	then 0
	else number_in_month(dates, hd(months)) + number_in_months(dates, tl(months))
	
fun dates_in_month(dates : (int*int*int) list, month : int) =
	if null dates
	then []
	else if month = #2 (hd(dates))
	then (hd(dates))::dates_in_month(tl(dates), month)
	else dates_in_month(tl(dates), month)
	
fun dates_in_months(dates : (int*int*int) list, months : int list) =
	if null dates
	then []
	else if null months
	then []
	else dates_in_month(dates, hd(months)) @ dates_in_months(dates, tl(months))
	
fun get_nth(strings : string list, n : int) =
	if null strings
	then ""
	else if n < 1
	then ""
	else if n = 1
	then hd(strings)
	else get_nth(tl(strings), n - 1)
	
fun date_to_string(date : int*int*int) =
	get_nth(["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"], #2 date) ^ 
	" " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
	
fun number_before_reaching_sum(sum : int, numbers : int list) =
	if null numbers
	then 0
	else if sum - hd(numbers) > 0
	then 1 + number_before_reaching_sum(sum - hd(numbers), tl(numbers))
	else 0
	
fun what_month(day : int) =
	number_before_reaching_sum(day, [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]) + 1
	
(*
fun what_month_day(day : int) =
	get_nth(["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
		number_before_reaching_sum(day, [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]) + 1)
*)
		
fun month_range(firstDate : int, secondDate : int) =
	if firstDate > secondDate
	then []
	else what_month(firstDate)::month_range(firstDate + 1, secondDate)
