CLASS zs4d400_20002_reset_values DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZS4D400_20002_RESET_VALUES IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  DATA myVal TYPE i Value 1234.
  DATA myval2 TYPE string.

  myval = 'Hilary'.
  clear myval.
   out->write( myval ).

  ENDMETHOD.
ENDCLASS.
