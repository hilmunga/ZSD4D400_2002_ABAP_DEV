CLASS zs4d400_20002_arithmetic_calc1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZS4D400_20002_ARITHMETIC_CALC1 IMPLEMENTATION.


    METHOD if_oo_adt_classrun~main.

* Declarations
**********************************************************************

    " comment/uncomment these line for different result types
    TYPES t_result TYPE p LENGTH 8 DECIMALS 2.
*    TYPES t_result TYPE p LENGTH 8 DECIMALS 0.
*    TYPES t_result TYPE i.

    DATA result TYPE i.

* Calculations
**********************************************************************
    " comment/uncomment these lines for different calculations

   result = 2 + 3.
*    result = 2 - 3.
*   result = 2 * 3.
*    result = 2 / 3.
*
*    result = sqrt( 2 ).
*    result = ipow( base = 2 exp = 3 ).
*
    result = ( 8 * 7 - 6 ) / ( 5 + 4 ).
*   result = 8 * 7 - 6 / 5 + 4.

* Output
**********************************************************************

    out->write( result ).



  ENDMETHOD.
ENDCLASS.
