using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SJ_Botique_System.Entities
{
    public class Card :Payment
    {
        // Data Members
        private string CardNo;
        private string BankName;


        // Methods
        public string GetCardNo()
        {
            return this.CardNo;
        }
        public void SetCardNo( string _cardNo)
        {
            this.CardNo = _cardNo;
        }
        public string GetBankName()
        {
            return this.BankName;
        }
        public void  SetBankName( string _bankName)
        {
            this.BankName = _bankName;
        }

        public override void MakePayment()
        {
            // code to Calculate Final Payment

        }
        public Card(int _id, string _cardNo, string _bankName): base (_id)
        {
            this.CardNo = _cardNo;
            this.BankName = _bankName;
        }
    }
}