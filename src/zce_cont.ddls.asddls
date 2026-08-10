@EndUserText.label: 'Custom Entity - Cont'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_CE_CONT'
@Metadata.allowExtensions: true
define root custom entity zce_cont
{
  key SO                         : vbelv; // I_SalesOrderItem-SalesOrder
  key SOItem                     : posnv; // I_SalesOrderItem-SalesOrderItem
  key SoLenhXuatHang             : vbeln; // I_OutboundDeliveryItem-OutboundDelivery
  key SoLenhXuatHangItem         : posnr; // I_OutboundDeliveryItem-OutboundDeliveryItem
      SoKH                       : abap.char(16); // SO/SOItem

      // I_SalesOrderItem
      NgayGiaoHangDuKien         : abap.dats(8); // RequestedDeliveryDate
      MaHang                     : matnr; // Product
      TenHang                    : arktx; // SalesOrderItemText

      // I_ClfnObjectCharcValue
      KichThhuocTui              : atwrt; // CharcValue

      // I_OutboundDelivery --> I_OverallGoodsMovementStatusT (_Text)
      TrangThaiOD                : abap.char(20);

      // I_OutboundDeliveryItem
      @ObjectModel.text.element  : [ 'PlantName' ]
      DiaDiemDongHang            : werks_d;         // Plant
      PlantName                  : abap.char(30);   // \_Plant-PlantName
      @Semantics.quantity.unitOfMeasure: 'DeliveryQuantityUnit'
      SoLuongTrenLenhXuatHang    : abap.quan(13,3); // ActualDeliveryQuantity
      DeliveryQuantityUnit       : vrkme;           // DeliveryQuantityUnit

      // I_SalesOrderScheduleLine
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      SoLuongTheoKHSX            : abap.quan(13,3); // ScheduleLineOrderQuantity
      BaseUnit                   : meins;           // BaseUnit

      // I_DeliveryDocument
      Ngay                       : abap.dats(8); // PlannedGoodsIssueDate

      // Get by Abstract Entity
      DongDauThung               : abap.string(0);
      NguoiPhuTrachCont          : abap.string(0);
      Cont                       : abap.string(0);
      KeHoachDongCont            : abap.string(0);

      // EML LongText I_OutboundDeliveryTP - LongTextID
      GioGoiContVeNM             : abap.string(0); // Z007
      SoCont                     : abap.string(0); // Z006
      SoChi                      : abap.string(0); // Z029
      NgayTauChay                : abap.string(0); // Z048
      GhiChuGiaoHang             : abap.string(0); // Z009
      ThoiGianCatMang            : abap.string(0); // Z008
      TareWeight                 : abap.string(0); // Z045

      // Chưa rõ logic
      Booking                    : abap.string(0);

      // Others
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      SoLuongChuaLenLenhXuatHang : abap.quan(13,3); // SoLuongTheoKHSX - SoLuongTrenLenhXuatHang

      //Excel
      CompanyCodeName            : butxt;
}
