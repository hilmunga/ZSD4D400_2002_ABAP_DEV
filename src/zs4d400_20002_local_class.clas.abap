CLASS zs4d400_20002_local_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zs4d400_20002_local_class IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*Declaring reference variables.

  DATA connection TYPE REF TO lcl_connection.
  DATA connections TYPE TABLE OF REF TO lcl_connection.

*Declaring empty objects from the reference variable.

  connection = NEW #(  ).

*Adding data to object variables.

  "connection->carrier_id = 'LH'.
  "connection->connection_id = '0400'.
  connection->set_attributes(
  EXPORTING
  i_carrier_id = 'DH' i_connection_id = '0403' ).

*Adding object references to internal tables.

    APPEND connection To connections.

    connection = NEW #(  ).
    connection->set_attributes(   i_carrier_id = 'AA' i_connection_id = '0017' ).

    LOOP AT connections INTO connection.



    connection->get_attributes( IMPORTING e_carrier_id = DATA(carrier_id) e_connection_id = DATA(connection_id) ).

    out->write( carrier_id ).
    out->write( connection_id ).
ENDLOOP.

  ENDMETHOD.
ENDCLASS.
