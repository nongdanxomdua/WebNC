//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebQLThueXe.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class YeuCau
    {
        public int MaYC { get; set; }
        public int MaKhach { get; set; }
        public string TenLoaiXe { get; set; }
        public Nullable<int> SoCho { get; set; }
        public Nullable<int> SoLuong { get; set; }
        public string GhiChu { get; set; }
    
        public virtual KHACH KHACH { get; set; }


        List<ListMKH> khaches = new List<ListMKH>();
        public IEnumerable<ListMKH> Items
        {
            get { return khaches; }
        } 
    }

    public partial class ListMKH
    {
        public KHACH _khach { get; set; }
        public int _maKhach { get; set; }
    }
}