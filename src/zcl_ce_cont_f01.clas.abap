CLASS zcl_ce_cont_f01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS requested
      IMPORTING
        io_request TYPE REF TO if_rap_query_request
      EXPORTING
        et_filters TYPE if_rap_query_filter=>tt_name_range_pairs.

    CLASS-METHODS response
      IMPORTING
        io_request  TYPE REF TO if_rap_query_request
        io_response TYPE REF TO if_rap_query_response
      CHANGING
        ct_result   TYPE zcl_ce_cont_top=>tt_result.

    CLASS-METHODS main
      IMPORTING
        it_filters TYPE if_rap_query_filter=>tt_name_range_pairs
      EXPORTING
        et_result  TYPE zcl_ce_cont_top=>tt_result.

  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-METHODS build_param
      IMPORTING
        it_filters            TYPE if_rap_query_filter=>tt_name_range_pairs
      EXPORTING
        er_diadiemdonghang    TYPE zcl_ce_cont_top=>ry_string
        er_so                 TYPE zcl_ce_cont_top=>ry_string
        er_solenhxuathang     TYPE zcl_ce_cont_top=>ry_string
        er_ngaygiaohangdukien TYPE zcl_ce_cont_top=>ry_string
        er_soitem             TYPE zcl_ce_cont_top=>ry_string
        er_solenhxuathangitem TYPE zcl_ce_cont_top=>ry_string
        er_ngay               TYPE zcl_ce_cont_top=>ry_string.

    CLASS-METHODS get_keys
      IMPORTING
        ir_diadiemdonghang    TYPE zcl_ce_cont_top=>ry_string
        ir_so                 TYPE zcl_ce_cont_top=>ry_string
        ir_solenhxuathang     TYPE zcl_ce_cont_top=>ry_string
        ir_ngaygiaohangdukien TYPE zcl_ce_cont_top=>ry_string
        ir_soitem             TYPE zcl_ce_cont_top=>ry_string
        ir_solenhxuathangitem TYPE zcl_ce_cont_top=>ry_string
        ir_ngay               TYPE zcl_ce_cont_top=>ry_string
      EXPORTING
        et_keys               TYPE zcl_ce_cont_top=>tt_key.

    CLASS-METHODS get_longtext_result_data
      IMPORTING
        it_longtext    TYPE zcl_ce_cont_top=>tt_longtext
        iv_longtextid  TYPE string
        iv_od          TYPE I_OutboundDelivery-OutboundDelivery
      RETURNING
        VALUE(rv_data) TYPE string.

    CLASS-METHODS get_longtext_result
      IMPORTING
        it_longtext TYPE zcl_ce_cont_top=>tt_longtext
        iv_od       TYPE I_OutboundDelivery-OutboundDelivery
      CHANGING
        cs_result   TYPE zce_cont.

    CLASS-METHODS get_longtext_cont
      IMPORTING
        it_keys     TYPE zcl_ce_cont_top=>tt_key
      EXPORTING
        et_longtext TYPE zcl_ce_cont_top=>tt_longtext.

    CLASS-METHODS build_result
      IMPORTING
        it_keys            TYPE zcl_ce_Cont_top=>tt_key
        it_longtext        TYPE zcl_ce_Cont_top=>tt_longtext
        it_bases           TYPE zcl_ce_Cont_top=>tt_base
        it_kichthuoctui    TYPE zcl_ce_Cont_top=>tt_kichthuoctui
        it_soluongtheokhsx TYPE zcl_ce_Cont_top=>tt_soluongtheokhsx
      EXPORTING
        et_result          TYPE zcl_ce_Cont_top=>tt_result.

    CLASS-METHODS get_bases
      IMPORTING
        it_keys  TYPE zcl_ce_cont_top=>tt_key
      EXPORTING
        et_bases TYPE zcl_ce_cont_top=>tt_base.

    CLASS-METHODS get_result_key
      IMPORTING
        is_key    TYPE zcl_ce_cont_top=>ty_key
      CHANGING
        cs_result TYPE zce_cont.

    CLASS-METHODS get_kichthuoctui
      IMPORTING
        it_bases        TYPE zcl_ce_cont_top=>tt_base
      EXPORTING
        et_kichthuoctui TYPE zcl_ce_cont_top=>tt_kichthuoctui.

    CLASS-METHODS get_soluongtheokhsx
      IMPORTING
        it_keys            TYPE zcl_ce_cont_top=>tt_key
      EXPORTING
        et_soluongtheokhsx TYPE zcl_ce_cont_top=>tt_soluongtheokhsx.

    CLASS-METHODS get_base_result
      IMPORTING
        it_bases        TYPE zcl_ce_cont_top=>tt_base
        is_key          TYPE zcl_ce_cont_top=>ty_key
        it_kichthuoctui TYPE zcl_ce_cont_top=>tt_kichthuoctui
      CHANGING
        cs_result       TYPE zce_cont.

    CLASS-METHODS get_soluongtheokhsx_result
      IMPORTING
        it_soluongtheokhsx TYPE zcl_ce_cont_top=>tt_soluongtheokhsx
        is_key             TYPE zcl_ce_cont_top=>ty_key
      CHANGING
        cs_result          TYPE zce_cont.

    CLASS-METHODS build_main
      IMPORTING
        ir_diadiemdonghang    TYPE zcl_ce_cont_top=>ry_string
        ir_so                 TYPE zcl_ce_cont_top=>ry_string
        ir_solenhxuathang     TYPE zcl_ce_cont_top=>ry_string
        ir_ngaygiaohangdukien TYPE zcl_ce_cont_top=>ry_string
        ir_soitem             TYPE zcl_ce_cont_top=>ry_string
        ir_solenhxuathangitem TYPE zcl_ce_cont_top=>ry_string
        ir_ngay               TYPE zcl_ce_cont_top=>ry_string
      EXPORTING
        et_keys               TYPE zcl_ce_cont_top=>tt_key
        et_bases              TYPE zcl_ce_cont_top=>tt_base
        et_longtext           TYPE zcl_ce_cont_top=>tt_longtext
        et_kichthuoctui       TYPE zcl_ce_cont_top=>tt_kichthuoctui
        et_soluongtheokhsx    TYPE zcl_ce_cont_top=>tt_soluongtheokhsx.

ENDCLASS.



CLASS zcl_ce_cont_f01 IMPLEMENTATION.
  METHOD main.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "1. Build Param
    build_param(
      EXPORTING
        it_filters            = it_filters
      IMPORTING
        er_diadiemdonghang    = DATA(lr_diadiemdonghang)
        er_so                 = DATA(lr_so)
        er_solenhxuathang     = DATA(lr_solenhxuathang)
        er_ngaygiaohangdukien = DATA(lr_ngaygiaohangdukien)
        er_soitem             = DATA(lr_soitem)
        er_solenhxuathangitem = DATA(lr_solenhxuathangitem)
        er_ngay               = DATA(lr_ngay)
    ).

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "2. Build Main Data
    build_main(
      EXPORTING
        ir_diadiemdonghang    = lr_diadiemdonghang
        ir_so                 = lr_so
        ir_solenhxuathang     = lr_solenhxuathang
        ir_ngaygiaohangdukien = lr_ngaygiaohangdukien
        ir_soitem             = lr_soitem
        ir_solenhxuathangitem = lr_solenhxuathangitem
        ir_ngay               = lr_ngay
      IMPORTING
        et_keys               = DATA(lt_keys)
        et_bases              = DATA(lt_bases)
        et_longtext           = DATA(lt_longtext)
        et_kichthuoctui       = DATA(lt_kichthuoctui)
        et_soluongtheokhsx    = DATA(lt_soluongtheokhsx)
    ).

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "3. Build Result Data
    build_result(
      EXPORTING
        it_keys            = lt_keys
        it_longtext        = lt_longtext
        it_bases           = lt_bases
        it_kichthuoctui    = lt_kichthuoctui
        it_soluongtheokhsx = lt_soluongtheokhsx
      IMPORTING
        et_result   = et_result
    ).
  ENDMETHOD.























  METHOD requested.
    TRY.
        et_filters = io_request->get_filter( )->get_as_ranges( ).
      CATCH cx_rap_query_filter_no_range.
        "handle exception
    ENDTRY.
  ENDMETHOD.



















  METHOD response.
    " ── a. AGGREGATION ──
    TRY.
        DATA(lo_aggregation) = io_request->get_aggregation( ).
        DATA(lt_group_by)    = lo_aggregation->get_grouped_elements( ).    " table of string
        DATA(lt_agg_elems)   = lo_aggregation->get_aggregated_elements( ). " table of ty_aggregation_element
      CATCH cx_rap_query_provider.
    ENDTRY.

    " ── b. RESPONSE ────────────────────────────────
    DATA(lv_total) = lines( ct_result ).

    IF io_request->is_total_numb_of_rec_requested( ).
      io_response->set_total_number_of_records( CONV int8( lv_total ) ).
    ENDIF.
    " ── c. HANDLE SORT ─────────────────────────────────────
    DATA(lt_sort) = io_request->get_sort_elements( ).
    IF lt_sort IS NOT INITIAL.
      DATA lt_sort_order TYPE abap_sortorder_tab.
      LOOP AT lt_sort INTO DATA(ls_sort).
        APPEND VALUE #(
            name       = ls_sort-element_name
            descending = ls_sort-descending
        ) TO lt_sort_order.
      ENDLOOP.
      SORT ct_result BY (lt_sort_order).
    ELSE.
      " Default sort
      SORT ct_result BY SoCont DESCENDING
                        SoLenhXuatHang DESCENDING
                        SoLenhXuatHangItem
                        so
                        soitem.
    ENDIF.

    " ── d. PAGING ──────────────────────────────────────────
    DATA(lv_skip) = io_request->get_paging( )->get_offset( ).
    DATA(lv_top)  = io_request->get_paging( )->get_page_size( ).

    IF lv_top = if_rap_query_paging=>page_size_unlimited.
      lv_top = lv_total.
    ENDIF.

    IF lv_skip > 0.
      DELETE ct_result TO lv_skip.
    ENDIF.

    IF lv_top < lines( ct_result ).
      DELETE ct_result FROM lv_top + 1.
    ENDIF.

    io_response->set_data( ct_result ).
  ENDMETHOD.























  METHOD build_param.
    LOOP AT it_filters INTO  DATA(ls_filter).
      CASE ls_filter-name.
        WHEN 'DIADIEMDONGHANG'.
          er_diadiemdonghang = CORRESPONDING zcl_ce_cont_top=>ry_string( ls_filter-range ).
        WHEN 'SO'.
          er_so = CORRESPONDING zcl_ce_cont_top=>ry_string( ls_filter-range ).
        WHEN 'SOLENHXUATHANG'.
          er_solenhxuathang = CORRESPONDING zcl_ce_cont_top=>ry_string( ls_filter-range ).
        WHEN 'SOLENHXUATHANGITEM'.
          er_solenhxuathangitem = CORRESPONDING zcl_ce_cont_top=>ry_string( ls_filter-range ).
        WHEN 'NGAYGIAOHANGDUKIEN'.
          er_ngaygiaohangdukien = CORRESPONDING zcl_ce_cont_top=>ry_string( ls_filter-range ).
        WHEN 'SOITEM'.
          er_soitem = CORRESPONDING zcl_ce_cont_top=>ry_string( ls_filter-range ).
        WHEN 'NGAY'.
          er_ngay = CORRESPONDING zcl_ce_cont_top=>ry_string( ls_filter-range ).
      ENDCASE.
    ENDLOOP.
  ENDMETHOD.





















  METHOD get_keys.
    "Modify DO và DOItem cho case có SO nhưng chưa tạo DO --> chạy vào trong detail sẽ lỗi nếu không handle
    DATA(lr_temp_solenhxuathang) = ir_solenhxuathang.
    DATA(lr_temp_solenhxuathangitem) = ir_solenhxuathangitem.

    IF lines( lr_temp_solenhxuathang ) = 1.
      READ TABLE lr_temp_solenhxuathang INTO DATA(ls_do) INDEX 1.
      IF sy-subrc = 0.
        IF ls_do-low IS INITIAL AND ls_do-high IS INITIAL.
          CLEAR: lr_temp_solenhxuathang.
        ENDIF.
      ENDIF.
    ENDIF.
    IF lines( lr_temp_solenhxuathangitem ) = 1.
      READ TABLE lr_temp_solenhxuathangitem INTO DATA(ls_doitem) INDEX 1.
      IF sy-subrc = 0.
        IF ( ls_doitem-low IS INITIAL OR ls_doitem-low = '000000' )
            AND ( ls_doitem-high IS INITIAL OR ls_doitem-high = '000000' ).
          CLEAR: lr_temp_solenhxuathangitem.
        ENDIF.
      ENDIF.
    ENDIF.

    "Select keys
    SELECT FROM I_SalesOrderitem AS a
    LEFT JOIN I_SalesOrderitem AS aMaterial
        ON aMaterial~SalesOrder              = a~SalesOrder
        AND aMaterial~SalesOrderItem         = a~SalesOrderItem
        AND aMaterial~SalesOrderItemCategory = 'TAN'

    LEFT JOIN I_SalesOrderPartner AS b
        ON b~SalesOrder = a~SalesOrder

    LEFT JOIN I_OutboundDeliveryItem AS c
        ON c~ReferenceSDDocument      = a~SalesOrder
        AND c~ReferenceSDDocumentItem = a~SalesOrderItem
        AND c~GoodsMovementType       = '601'
        AND c~product                 = amaterial~product
        AND c~ActualDeliveryQuantity > 0
        AND ( a~DeliveryStatus = 'B' OR a~DeliveryStatus = 'C' )
    LEFT JOIN I_OutboundDelivery AS d
        ON d~OutboundDelivery = c~OutboundDelivery
    LEFT JOIN I_DeliveryDocument AS e
        ON e~DeliveryDocument = d~OutboundDelivery
        AND e~DeliveryDocumentType = 'LF'
    FIELDS
        a~SalesOrder           AS so,
        a~SalesOrderItem       AS SOItem,
        c~OutboundDelivery     AS SoLenhXuatHang,
        c~OutboundDeliveryItem AS SoLenhXuatHangItem
    WHERE
        a~SalesOrderType             = 'TA'
        AND b~Customer               NOT IN ('0000006710','0000006720')
        AND a~SalesOrderItemCategory IN ('TAN', 'CBXN')

        AND a~plant                 IN @ir_diadiemdonghang
        AND a~SalesOrder            IN @ir_so
        AND c~OutboundDelivery      IN @lr_temp_solenhxuathang
        AND a~RequestedDeliveryDate IN @ir_ngaygiaohangdukien
        AND a~SalesOrderItem        IN @ir_soitem
        AND c~OutboundDeliveryItem  IN @lr_temp_solenhxuathangitem
        AND CASE WHEN e~OverallGoodsMovementStatus = 'C' THEN e~ActualGoodsMovementDate
                 WHEN e~OverallGoodsMovementStatus IN ( 'A','B' ) THEN e~PlannedGoodsIssueDate
                 END IN @ir_ngay
    GROUP BY
        a~SalesOrder,
        a~SalesOrderItem,
        c~OutboundDelivery,
        c~OutboundDeliveryItem
    ORDER BY
        a~SalesOrder,
        a~SalesOrderItem,
        c~OutboundDelivery DESCENDING,
        c~OutboundDeliveryItem DESCENDING
    INTO TABLE @et_keys.
  ENDMETHOD.





















  METHOD get_longtext_result_data.
    READ TABLE it_longtext INTO DATA(ls_longtext) WITH KEY entity
      COMPONENTS %key-OutboundDelivery = iv_od
                 %key-LongTextID = iv_longtextid
                 %key-Language = sy-langu.
    IF sy-subrc = 0.
      rv_data = ls_longtext-LongText.
    ENDIF.
  ENDMETHOD.





















  METHOD get_longtext_result.
    "Giờ gọi cont về nhà máy - Z007
    cs_result-GioGoiContVeNM = get_longtext_result_data( it_longtext   = it_longtext
                                                 iv_longtextid = 'Z007'
                                                 iv_od         = iv_od ).
    "Số Cont - Z006
    cs_result-SoCont = get_longtext_result_data( it_longtext   = it_longtext
                                                 iv_longtextid = 'Z006'
                                                 iv_od         = iv_od ).
    "Số chì - Z029
    cs_result-SoChi = get_longtext_result_data( it_longtext   = it_longtext
                                                 iv_longtextid = 'Z029'
                                                 iv_od         = iv_od ).
    "Ngày tàu chạy - Z048
    cs_result-NgayTauChay = get_longtext_result_data( it_longtext   = it_longtext
                                                      iv_longtextid = 'Z048'
                                                      iv_od         = iv_od ).
    "Ghi chú giao hàng - Z009
    cs_result-GhiChuGiaoHang = get_longtext_result_data( it_longtext   = it_longtext
                                                         iv_longtextid = 'Z009'
                                                         iv_od         = iv_od ).
    "Thời gian cắt máng - Z008
    cs_result-ThoiGianCatMang = get_longtext_result_data( it_longtext   = it_longtext
                                                          iv_longtextid = 'Z008'
                                                          iv_od         = iv_od ).
    "Tare Weight - Z045
    cs_result-TareWeight = get_longtext_result_data( it_longtext   = it_longtext
                                                     iv_longtextid = 'Z045'
                                                     iv_od         = iv_od ).
  ENDMETHOD.


















  METHOD get_longtext_cont.
    READ ENTITIES OF I_OutboundDeliveryTP FORWARDING PRIVILEGED
    ENTITY OutboundDelivery
    BY \_Text
    ALL FIELDS WITH VALUE #( FOR key IN it_keys
        ( OutboundDelivery = key-solenhxuathang )
    )
    RESULT et_longtext
    FAILED DATA(ls_failed)
    REPORTED DATA(lt_reported).
  ENDMETHOD.

















  METHOD build_result.
    LOOP AT it_keys  INTO DATA(ls_key).
      DATA(lv_tabix) = sy-tabix.

      APPEND INITIAL LINE TO et_result ASSIGNING FIELD-SYMBOL(<lfs_result>).
      "Key fields
      get_result_key( EXPORTING is_key    = ls_key
                      CHANGING  cs_result = <lfs_result> ).

      "Long text fields
      get_longtext_result( EXPORTING it_longtext = it_longtext
                                     iv_od       = ls_key-solenhxuathang
                           CHANGING  cs_result   = <lfs_result> ).

      "Base fields
      get_base_result( EXPORTING it_bases        = it_bases
                                 is_key          = ls_key
                                 it_kichthuoctui = it_kichthuoctui
                       CHANGING  cs_result       = <lfs_result> ).

*      "Số lượng theo KHSX
*      get_soluongtheokhsx_result( EXPORTING it_soluongtheokhsx = it_soluongtheokhsx
*                                            is_key             = ls_key
*                                  CHANGING  cs_result          = <lfs_result> ).
    ENDLOOP.
  ENDMETHOD.



















  METHOD get_bases.
    SELECT FROM @it_keys AS a
    LEFT JOIN I_SalesOrderItem AS b
        ON b~SalesOrder = a~so
        AND b~SalesOrderItem = a~soitem
    LEFT JOIN I_CnsldtnPlantT AS c
        ON c~plant = b~plant
        AND c~Language = @sy-langu
    LEFT JOIN I_OutboundDeliveryItem AS d
        ON d~OutboundDelivery = a~solenhxuathang
        AND d~OutboundDeliveryItem = a~solenhxuathangitem
    LEFT JOIN zi_cont_text AS e
        ON e~So = a~so
        AND e~SoItem = a~soitem
        AND e~SoLenh = a~solenhxuathang
        AND e~SoLenhItem = a~solenhxuathangitem
    LEFT JOIN I_CompanyCode AS f
        ON f~CompanyCode = b~SalesOrganization
    LEFT JOIN I_DeliveryDocument AS g
        ON g~DeliveryDocument = a~solenhxuathang
        AND g~DeliveryDocumentType = 'LF'
    LEFT JOIN I_SalesOrderScheduleLine AS h
        ON h~SalesOrder = a~so
        AND h~SalesOrderItem = a~soitem
    LEFT JOIN I_OutboundDelivery AS i
        ON i~OutboundDelivery = a~solenhxuathang
        AND i~OverallGoodsMovementStatus IS NOT INITIAL
    FIELDS
        "Key
        a~so,
        a~soitem,
        a~solenhxuathang,
        a~solenhxuathangitem,

        "Base
        b~RequestedDeliveryDate AS NgayGiaoHangDuKien,
        b~Product AS MaHang,
        b~SalesOrderItemText AS TenHang,
        b~Plant,
        c~PlantName,
        d~ActualDeliveryQuantity AS SoLuongTrenLenhXuatHang,
        d~DeliveryQuantityUnit,

        "Z Table
        e~DongDauThung,
        e~NguoiPhuTrach,
        e~Cont,
        e~KeHoachDongCont,

        "Excel
        f~CompanyCodeName,
        CASE WHEN g~OverallGoodsMovementStatus = 'C'
                THEN g~ActualGoodsMovementDate
             WHEN g~OverallGoodsMovementStatus IN ( 'A','B' )
                THEN g~PlannedGoodsIssueDate
        END AS Ngay,

        "Số lượng chưa lên lệnh xuất hàng
        h~OpenConfdDelivQtyInBaseUnit AS SoLuongChuaLenLenhXuatHang,

        "Trạng thái OD
        i~\_OverallGoodsMovementStatus\_Text[ Language = @sy-langu ]-OverallGoodsMovementStatusDesc AS TrangThaiOD
    INTO TABLE @et_bases.
  ENDMETHOD.


























  METHOD get_result_key.
    cs_result-so                 = is_key-so.
    cs_result-SOItem             = is_key-soitem.
    cs_result-SoLenhXuatHang     = is_key-solenhxuathang.
    cs_result-SoLenhXuatHangItem = is_key-solenhxuathangitem.

    "Số Kế hoạch
    DATA(lv_so) = |{ is_key-so ALPHA = OUT }|.
    DATA(lv_soitem) = |{ is_key-soitem ALPHA = OUT }|.

    cs_result-SoKH = |{ lv_so }/{ lv_soitem }|.
    CONDENSE: cs_result-SoKH NO-GAPS.
  ENDMETHOD.


























  METHOD get_kichthuoctui.
    "Bước 1: Check CDS view I_CLFNCHARACTERISTIC,
    "   check CHARACTERISTIC = Z_KICHTHUOC,
    "   lấy CHARCINTERNALID và TIMEINTERVALNUMBER
    SELECT SINGLE FROM I_ClfnCharacteristic
    FIELDS
        CharcInternalID,
        TimeIntervalNumber
    WHERE
        Characteristic = 'Z_KICHTHUOC'
    INTO @DATA(ls_kichthuoc).

    CHECK sy-subrc = 0.
    "Bước 2: CDS view I_CLFNOBJECTCHARCVALUE:
    "   Classtype = 001,
    "   CLFNOBJECTID = mã thành phẩm,
    "   CLFNOBJECTTABLE = MARA,
    "   CHARCINTERNALID =  CHARCINTERNALID  lấy được ở bước 1,
    "   TIMEINTERVALNUMBER=TIMEINTERVALNUMBER lấy được ở bước 1,
    "   ==> lấy trường CHARCVALUE
    SELECT FROM @it_bases AS a
    LEFT JOIN I_ClfnObjectCharcValue AS b
      ON b~ClfnObjectID = a~mahang
    FIELDS
        "Key fields
        a~so,
        a~soitem,
        a~solenhxuathang,
        a~solenhxuathangitem,
        b~ClfnObjectID AS mahang,

        b~CharcValue AS KichThuocTui
    WHERE
        b~ClassType = '001'
        AND b~ClfnObjectTable = 'MARA'
        AND b~CharcInternalID = @ls_kichthuoc-CharcInternalID
        AND b~TimeIntervalNumber = @ls_kichthuoc-TimeIntervalNumber
    INTO TABLE @et_kichthuoctui.
  ENDMETHOD.



























  METHOD get_soluongtheokhsx.
    "Số lượng theo KHSX
    "Từ số SO/Item ở (1) và (2) vào CDS view I_SALESORDERSCHEDULELINE:
    "   lọc theo
    "       Sales Order,
    "       Sales Order Item,
    "       IsRequestedDelivSchedLine = "X",
    "       DELIVBLOCKREASONFORSCHEDLINE = null,
    "   lấy tổng OPENCONFDDELIVQTYINBASEUNIT của các line thỏa mãn điều kiện
    SELECT FROM @it_keys AS a
    INNER JOIN i_salesorderscheduleline AS b
        ON b~SalesOrder      = a~so
        AND b~SalesOrderItem = a~soitem
        AND b~IsRequestedDelivSchedLine = 'X'
        AND b~DelivBlockReasonForSchedLine IS INITIAL
    FIELDS
        "key fields
        a~so,
        a~soitem,
        a~solenhxuathang,
        a~solenhxuathangitem,
        b~BaseUnit,

        SUM( b~ScheduleLineOrderQuantity ) AS soluongtheokhsx
    GROUP BY
        a~so,
        a~soitem,
        a~solenhxuathang,
        a~solenhxuathangitem,
        b~BaseUnit
    ORDER BY
        a~so,
        a~soitem,
        a~solenhxuathang DESCENDING,
        a~solenhxuathangitem DESCENDING
    INTO TABLE @et_soluongtheokhsx.

    CHECK sy-subrc = 0.
    "Format số lượng --> chỉ lấy line cuối của số lượng nếu trùng SO và SOItem
    LOOP AT et_soluongtheokhsx ASSIGNING FIELD-SYMBOL(<lfs_line>)
         GROUP BY ( so     = <lfs_line>-so
                    soitem = <lfs_line>-soitem
                    size   = GROUP SIZE )
         ASSIGNING FIELD-SYMBOL(<lfs_grp>).

      DATA(lv_lines) = <lfs_grp>-size.
      DATA(lv_idx)   = 0.

      LOOP AT GROUP <lfs_grp> ASSIGNING FIELD-SYMBOL(<lfs_member>).
        lv_idx += 1.

        IF lv_idx < lv_lines.
          CLEAR <lfs_member>-soluongtheokhsx.
        ENDIF.
      ENDLOOP.

    ENDLOOP.
  ENDMETHOD.
































  METHOD get_base_result.
    READ TABLE it_bases INTO DATA(ls_base) WITH KEY so                 = is_key-so
                                                    soitem             = is_key-soitem
                                                    solenhxuathang     = is_key-solenhxuathang
                                                    solenhxuathangitem = is_key-solenhxuathangitem.
    IF sy-subrc = 0.
      cs_result-NgayGiaoHangDuKien      = ls_base-ngaygiaohangdukien.
      cs_result-MaHang                  = ls_base-mahang.
      cs_result-TenHang                 = ls_base-tenhang.
      cs_result-DiaDiemDongHang         = ls_base-diadiemdonghang.
      cs_result-PlantName               = ls_base-plantname.
      cs_result-SoLuongTrenLenhXuatHang = ls_base-soluongtrenlenhxuathang.
      cs_result-DeliveryQuantityUnit    = ls_base-deliveryquantityunit.

      "Z table
      cs_result-DongDauThung      = ls_base-dongdauthung.
      cs_result-NguoiPhuTrachCont = ls_base-nguoiphutrach.
      cs_result-Cont              = ls_base-cont.
      cs_result-KeHoachDongCont   = ls_base-kehoachdongcont.

      "Kích thước túi
      READ TABLE it_kichthuoctui INTO DATA(ls_kichthuoctui) WITH KEY so                 = ls_base-so
                                                                     soitem             = ls_base-soitem
                                                                     solenhxuathang     = ls_base-solenhxuathang
                                                                     solenhxuathangitem = ls_base-solenhxuathangitem
                                                                     mahang             = ls_base-mahang.
      IF sy-subrc = 0.
        cs_result-KichThhuocTui = ls_kichthuoctui-kichthuoctui.
      ENDIF.

      "Excel
      cs_result-CompanyCodeName            = ls_base-companycodename.
      cs_result-Ngay                       = ls_base-ngay.

      "Số lượng chưa lên lệnh xuất hàng
      cs_result-SoLuongChuaLenLenhXuatHang = ls_base-soluongchualenlenhxuathang.

      "Trạng thái OD
      cs_result-TrangThaiOD = ls_base-trangthaiod.
    ENDIF.
  ENDMETHOD.
































  METHOD get_soluongtheokhsx_result.
    READ TABLE it_soluongtheokhsx INTO DATA(ls_soluongtheokhsx) WITH KEY so                 = is_key-so
                                                                         soitem             = is_key-soitem
                                                                         solenhxuathang     = is_key-solenhxuathang
                                                                         solenhxuathangitem = is_key-solenhxuathangitem.
    IF sy-subrc = 0.
      cs_result-SoLuongTheoKHSX = ls_soluongtheokhsx-soluongtheokhsx.
      cs_result-BaseUnit        = ls_soluongtheokhsx-baseunit.
    ENDIF.
  ENDMETHOD.



























  METHOD build_main.
    "1. Get key
    get_keys(
      EXPORTING
        ir_diadiemdonghang    = ir_diadiemdonghang
        ir_so                 = ir_so
        ir_solenhxuathang     = ir_solenhxuathang
        ir_ngaygiaohangdukien = ir_ngaygiaohangdukien
        ir_soitem             = ir_soitem
        ir_solenhxuathangitem = ir_solenhxuathangitem
        ir_ngay               = ir_ngay
      IMPORTING
        et_keys               = et_keys
    ).
    "2. Get longtext
    get_longtext_cont(
      EXPORTING
        it_keys     = et_keys
      IMPORTING
        et_longtext = et_longtext
    ).
    "3. Get base
    get_bases(
      EXPORTING
        it_keys  = et_keys
      IMPORTING
        et_bases = et_bases
    ).
    "4. Get Kích thước túi
    get_kichthuoctui(
      EXPORTING
        it_bases        = et_bases
      IMPORTING
        et_kichthuoctui = et_kichthuoctui
    ).
*    "5. Get Số lượng theo kế hoạch sản xuất
*    get_soluongtheokhsx(
*      EXPORTING
*        it_keys            = et_keys
*      IMPORTING
*        et_soluongtheokhsx = et_soluongtheokhsx
*    ).
  ENDMETHOD.





























ENDCLASS.
