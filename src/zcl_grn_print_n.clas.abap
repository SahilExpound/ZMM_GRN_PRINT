CLASS zcl_grn_print_n DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    METHODS get_pdf_64
      IMPORTING
        VALUE(io_materialdocno)   TYPE i_materialdocumentheader_2-materialdocument
        VALUE(io_materialdocdat)  TYPE i_materialdocumentheader_2-postingdate
        VALUE(io_materialdocyear) TYPE i_materialdocumentheader_2-MaterialDocumentYear
      RETURNING
        VALUE(pdf_64)             TYPE string.

  PRIVATE SECTION.
    METHODS build_xml
      IMPORTING
        VALUE(io_materialdocno)   TYPE i_materialdocumentheader_2-materialdocument
        VALUE(io_materialdocdat)  TYPE i_materialdocumentheader_2-postingdate
        VALUE(io_materialdocyear) TYPE i_materialdocumentheader_2-MaterialDocumentYear
      RETURNING
        VALUE(rv_xml)             TYPE string.

ENDCLASS.



CLASS ZCL_GRN_PRINT_N IMPLEMENTATION.


  METHOD get_pdf_64.

    DATA(lv_xml) = build_xml(
                      io_materialdocno   = io_materialdocno
                      io_materialdocdat  = io_materialdocdat
                      io_materialdocyear = io_materialdocyear ).



    IF lv_xml IS INITIAL.
      RETURN.
    ENDIF.

    CALL METHOD zadobe_ads_class=>getpdf
      EXPORTING
        template = 'ZGRN_PRINT/ZGRN_PRINT'
        xmldata  = lv_xml
      RECEIVING
        result   = DATA(lv_result).

    IF lv_result IS NOT INITIAL.
      pdf_64 = lv_result.
    ENDIF.

  ENDMETHOD.


  METHOD build_xml.

  ENDMETHOD.
ENDCLASS.
