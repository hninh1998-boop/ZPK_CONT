CLASS lhc_Cont DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Cont RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Cont RESULT result.

    METHODS read FOR READ
      IMPORTING keys FOR READ Cont RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK Cont.

    METHODS updContText FOR MODIFY
      IMPORTING keys FOR ACTION Cont~updContText.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE Cont.

ENDCLASS.

CLASS lhc_Cont IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.


  METHOD get_instance_features.
  ENDMETHOD.



















  METHOD get_instance_authorizations.
  ENDMETHOD.

























  METHOD read.
    SELECT FROM ztb_cont_text
    FIELDS
        so,
        so_item,
        so_lenh,
        so_lenh_item,

        dong_dau_thung,
        nguoi_phu_trach,
        cont,
        ke_hoach_dong_cont
    FOR ALL ENTRIES IN @keys
    WHERE
        so = @keys-so
        AND so_item = @keys-SOItem
        AND so_lenh = @keys-SoLenhXuatHang
        AND so_lenh_item = @keys-SoLenhXuatHangItem
    INTO TABLE @DATA(lt_read).

    LOOP AT lt_read INTO DATA(ls_read).
      APPEND INITIAL LINE TO result ASSIGNING FIELD-SYMBOL(<lfs_result>).
      <lfs_result>-so                 = ls_read-so.
      <lfs_result>-SOItem             = ls_read-so_item.
      <lfs_result>-SoLenhXuatHang     = ls_read-so_lenh.
      <lfs_result>-SoLenhXuatHangItem = ls_read-so_lenh_item.

      <lfs_result>-DongDauThung      = ls_read-dong_dau_thung.
      <lfs_result>-NguoiPhuTrachCont = ls_read-nguoi_phu_trach.
      <lfs_result>-Cont              = ls_read-cont.
      <lfs_result>-KeHoachDongCont   = ls_read-ke_hoach_dong_cont.
    ENDLOOP.
  ENDMETHOD.

























  METHOD lock.
  ENDMETHOD.




















  METHOD updContText.

    DATA: lt_cont_text TYPE STANDARD TABLE OF ztb_cont_text.
    LOOP AT keys INTO DATA(ls_key).
      APPEND INITIAL LINE TO lt_cont_text ASSIGNING FIELD-SYMBOL(<lfs_cont_text>).
      <lfs_cont_text>-client = sy-mandt.

      <lfs_cont_text>-so           = ls_key-%key-so.
      <lfs_cont_text>-so_item      = ls_key-%key-SOItem.
      <lfs_cont_text>-so_lenh      = ls_key-%key-SoLenhXuatHang.
      <lfs_cont_text>-so_lenh_item = ls_key-%key-SoLenhXuatHangItem.

      <lfs_cont_text>-dong_dau_thung     = ls_key-%param-DongDauThung.
      <lfs_cont_text>-nguoi_phu_trach    = ls_key-%param-NguoiPhuTrachCont.
      <lfs_cont_text>-cont               = ls_key-%param-Cont.
      <lfs_cont_text>-ke_hoach_dong_cont = ls_key-%param-KeHoachDongCont.

      <lfs_cont_text>-changed_by            = sy-uname.
      <lfs_cont_text>-changed_at            = utclong_current( ).

      APPEND VALUE #(
        %tky = ls_key-%tky
        %msg = new_message( id       = 'ZCONT'
                            number   = '000'
                            severity = if_abap_behv_message=>severity-success
                            v1       = 'Cập nhật thông tin Cont thành công' )
      ) TO reported-cont.
    ENDLOOP.

    zcl_ce_cont_text_buffer=>set_data( it_data = lt_cont_text ).

    READ ENTITIES OF zce_cont IN LOCAL MODE
    ENTITY cont
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_cont).

    MODIFY ENTITIES OF zce_cont IN LOCAL MODE
    ENTITY cont
    UPDATE FIELDS ( GioGoiContVeNM DongDauThung NguoiPhuTrachCont Cont KeHoachDongCont )
    WITH VALUE #( FOR ls_cont IN lt_cont
        ( %tky = ls_cont-%tky
          %data-DongDauThung      = keys[ 1 ]-%param-DongDauThung
          %data-NguoiPhuTrachCont = keys[ 1 ]-%param-NguoiPhuTrachCont
          %data-Cont              = keys[ 1 ]-%param-Cont
          %data-KeHoachDongCont   = keys[ 1 ]-%param-KeHoachDongCont
        )
    ).
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZCE_CONT DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZCE_CONT IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
    zcl_ce_cont_text_buffer=>get_data(
      IMPORTING
        et_data = DATA(lt_cont_text)
    ).

    IF lt_cont_text IS NOT INITIAL.
      MODIFY ztb_cont_text FROM TABLE @lt_cont_text.
      IF sy-subrc <> 0.
        CHECK 1 = 1.
      ENDIF.
    ENDIF.
  ENDMETHOD.

  METHOD cleanup.
    zcl_ce_cont_text_buffer=>clear_data( ).
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
