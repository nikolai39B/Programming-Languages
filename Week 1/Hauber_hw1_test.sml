(*
	Will Hauber
	Homework 1
	01/15/2016
	
	Hauber_hw1_test.sml
*)

use "Hauber_hw1.sml";
val test_1				= "is_older";
val yearEarly_1			= is_older((1, 1, 1), (2, 1, 1)) = true;
val yearLate_1			= is_older((2, 1, 1), (1, 1, 1)) = false;
val monthEarly_1		= is_older((1, 1, 1), (1, 2, 1)) = true;
val monthLate_1			= is_older((1, 2, 1), (1, 1, 1)) = false;
val dayEarly_1			= is_older((1, 1, 1), (1, 1, 2)) = true;
val dayLate_1			= is_older((1, 1, 2), (1, 1, 1)) = false;
val same_1				= is_older((1, 1, 1), (1, 1, 1)) = false;

val test_2				= "number_in_month";
val nullDates_2			= number_in_month([], 1) = 0;
val zeroDates_2			= number_in_month([(1, 1, 1), (2, 2, 2), (3, 3, 3)], 4) = 0;
val oneDate_2			= number_in_month([(1, 1, 1), (2, 2, 2), (3, 3, 3)], 1) = 1;
val twoDates_2			= number_in_month([(1, 1, 1), (2, 1, 2), (3, 3, 3)], 1) = 2;
val threeDates_2		= number_in_month([(1, 1, 1), (2, 3, 2), (3, 3, 3), (4, 3, 4)], 3) = 3;
val allDates_2			= number_in_month([(1, 0, 1), (2, 0, 2), (3, 0, 3), (4, 0, 4)], 0) = 4;

val test_3				= "number_in_months";
val nullMonths_3		= number_in_months([(1, 1, 1), (2, 2, 2), (3, 3, 3)], []) = 0;
val oneMonth1_3			= number_in_months([(1, 1, 1), (2, 2, 2), (3, 3, 3)], [1]) = 1;
val oneMonth2_3			= number_in_months([(1, 1, 1), (2, 2, 2), (3, 3, 3)], [5]) = 0;
val twoMonths1_3		= number_in_months([(1, 1, 1), (2, 2, 2), (3, 3, 3)], [0, 5]) = 0;
val twoMonths2_3		= number_in_months([(1, 1, 1), (2, 2, 2), (3, 3, 3)], [0, 3]) = 1;
val twoMonths3_3		= number_in_months([(1, 1, 1), (2, 2, 2), (3, 3, 3)], [2, 3]) = 2;
val threeMonths1_3		= number_in_months([(1, 1, 1), (2, 2, 2), (3, 3, 3)], [0, 2, 3]) = 2;
val threeMonths2_3		= number_in_months([(1, 1, 1), (2, 2, 2), (3, 3, 3)], [3, 1, 2]) = 3;

val test_4				= "dates_in_month";
val nullDates_4			= dates_in_month([], 1) = [];
val zeroDates_4			= dates_in_month([(1, 1, 1), (2, 2, 2), (3, 3, 3)], 4) = [];
val oneDate_4			= dates_in_month([(1, 1, 1), (2, 2, 2), (3, 3, 3)], 1) = [(1, 1, 1)];
val twoDates_4			= dates_in_month([(1, 1, 1), (2, 1, 2), (3, 3, 3)], 1) = [(1, 1, 1), (2, 1, 2)];
val threeDates_4		= dates_in_month([(1, 1, 1), (2, 3, 2), (3, 3, 3), (4, 3, 4)], 3) = [(2, 3, 2), (3, 3, 3), (4, 3, 4)];
val allDates_4			= dates_in_month([(1, 0, 1), (2, 0, 2), (3, 0, 3), (4, 0, 4)], 0) = [(1, 0, 1), (2, 0, 2), (3, 0, 3), (4, 0, 4)];

val test_5				= "dates_in_months";
val nullMonths_5		= dates_in_months([(1, 1, 1), (2, 2, 2), (3, 3, 3)], []) = [];
val oneMonth1_5			= dates_in_months([(1, 1, 1), (2, 2, 2), (3, 3, 3)], [1]) = [(1, 1, 1)];
val oneMonth2_5			= dates_in_months([(1, 1, 1), (2, 2, 2), (3, 3, 3)], [5]) = [];
val twoMonths1_5		= dates_in_months([(1, 1, 1), (2, 2, 2), (3, 3, 3)], [0, 5]) = [];
val twoMonths2_5		= dates_in_months([(1, 1, 1), (2, 2, 2), (3, 3, 3)], [0, 3]) = [(3, 3, 3)];
val twoMonths3_5		= dates_in_months([(1, 1, 1), (2, 2, 2), (3, 3, 3)], [2, 3]) = [(2, 2, 2), (3, 3, 3)];
val threeMonths1_5		= dates_in_months([(1, 1, 1), (2, 2, 2), (3, 3, 3)], [0, 2, 3]) = [(2, 2, 2), (3, 3, 3)];
val threeMonths2_5		= dates_in_months([(1, 1, 1), (2, 2, 2), (3, 3, 3)], [3, 1, 2]) = [(3, 3, 3), (1, 1, 1), (2, 2, 2)];

val test_6				= "get_nth";
val nullStrings_6		= get_nth([], 2) = "";
val badN_6				= get_nth(["hello", "world"], 0) = "";
val firstElem_6			= get_nth(["hello", "world"], 1) = "hello";
val secondElem_6		= get_nth(["hello", "world"], 2) = "world";
val bigN_6				= get_nth(["hello", "world"], 5) = "";

val test_7				= "date_to_string";
val basic1_7			= date_to_string(1, 1, 1) = "January 1, 1";
val basic2_7			= date_to_string(5, 6, 7) = "June 7, 5";
val realistic_7			= date_to_string(2016, 1, 15) = "January 15, 2016";
val invalidMonth_7		= date_to_string(1, 13, 1) = " 1, 1";

val test_8				= "number_before_reaching_sum";
val nullNumbers_8		= number_before_reaching_sum(5, []) = 0;
val lowSum_8			= number_before_reaching_sum(1, [2, 3]) = 0;
val basic1_8			= number_before_reaching_sum(4, [3, 5]) = 1;
val basic2_8			= number_before_reaching_sum(9, [3, 5]) = 2;
val basic3_8			= number_before_reaching_sum(9, [3, 5, 2]) = 2;
val basic4_8			= number_before_reaching_sum(6, [1, 2, 3]) = 2;
val bigSum_8			= number_before_reaching_sum(2500, [8, 9, 21, 4, 3, 5000]) = 5;
val overflow_8			= number_before_reaching_sum(2500, [8, 9, 21, 4, 3, 5]) = 6;

(*
val test_9				= "what_month";
val january1_9			= what_month(28) = "January";
val january2_9			= what_month(31) = "January";
val february1_9			= what_month(32) = "February";
val february1_9			= what_month(59) = "February";
val november_9			= what_month(334) = "November";
val december1_9			= what_month(335) = "December";
val december2_9			= what_month(365) = "December";
*)
val test_9				= "what_month";
val january1_9			= what_month(28) = 1;
val january2_9			= what_month(31) = 1;
val february1_9			= what_month(32) = 2;
val february1_9			= what_month(59) = 2;
val november_9			= what_month(334) = 11;
val december1_9			= what_month(335) = 12;
val december2_9			= what_month(365) = 12;

val test_10				= "month_range";
val older_10			= month_range(21, 20) = [];
val equal1_10			= month_range(1, 1) = [1];
val equal2_10			= month_range(151, 151) = [5];
val basic1_10			= month_range(151, 152) = [5, 6];
val basic2_10			= month_range(151, 182) = [5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7];
