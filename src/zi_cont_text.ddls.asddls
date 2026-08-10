@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'zi_cont_text'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_cont_text
  as select from ztb_cont_text
{
  key so                 as So,
  key so_item            as SoItem,
  key so_lenh            as SoLenh,
  key so_lenh_item       as SoLenhItem,
      dong_dau_thung     as DongDauThung,
      nguoi_phu_trach    as NguoiPhuTrach,
      cont               as Cont,
      ke_hoach_dong_cont as KeHoachDongCont,
      changed_by         as ChangedBy,
      changed_at         as ChangedAt
}
