
*Determinations are used to fill in fields of an entity based on the values of other fields. In this example, we will create a determination for the GetCities action, which will fill in the City_From, CountryCode, City_To, and CountryCode_To fields based on the AirportFromId and AirportToId fields.
determination GetCities 
  on save ( field AirportfromId, AirportToId; ).

  *Behaviour imlementation for the GetCities determination.
  CLASS lcl_handler DEFINITION
  INHERITING FROM cl_abap_behavior_handler.
    PRIVATE SECTION.
      METHODS get_cities 
      FOR DETERMINE ON SAVE.
      IMPORTING keys
      FOR Connection~GetCities.

  ENDCLASS.






The READ ENTITIES statement returns an internal table with the derived type FOR READ RESULT. To change the data in the transactional buffer, you need a MODIFY ENTITIES statement. 



READ ENTITIES OF zs400_r_connections
  ENTITY connections
  FIELDS( AirpotFromId, AirportToId )
  WITH CORRESPONDING #( keys )
  RESULT DATA(connection).
  

LOOP AT connections INTO DATA(connection).
    SELECT SINGLE
     FROM /dmo/airport
      FIELDS City, CountryCode
      WHERE airport_id = @connection-AirpotFromId
      INTO ( @connection-City_From, @connection-CountryCode ).

    SELECT SINGLE
     FROM /dmo/airport
      FIELDS City, CountryCode
      WHERE airport_id = @connection-AirportToId
      INTO ( @connection-City_To, @connection-CountryCode_To ).
    MODIFY connections FROM connection.


    DATA connection_upd TYPE TABLE FOR UPDATE zs400_r_connections.
    connection_upd = corresponding #( connections ).

    MODIFY ENTITIES OF zs400_r_connections
      ENTITY connections
      UPDATE
       FIELDS ( City_From, CountryCode, City_To, CountryCode_To )
      WITH connection_upd
      REPORTED DATA(reported_records).
    reported-connection =corresponding #( reported_records-connection ).
    ENDLOOP.