CLASS zcl_20002_compute DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_20002_COMPUTE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*Declaration
**********************************************************************

  DATA number1 TYPE i.
  DATA number2 type i.

  number1 = -8.
  number2 = 3.
*In line declaration
  DATA(result) =  number1 / number2.
  out->write( result  ).
  out->write(  EXPORTING data = result name = 'RESULT:' ).

*using string template to display values themselves in string form.
  DATA(output)  = |{ number1 } / { number2 } = { result }|.
  out->write( EXPORTING data = output name ='OUTPUT' ).

*Make sure the result is rounded to a value with 2 decimal places, and not to an integer value.

DATA results TYPE p LENGTH 8 DECIMAlS 2.
    results = number1 / number2.
    out->write( results ).




  ENDMETHOD.
ENDCLASS.
