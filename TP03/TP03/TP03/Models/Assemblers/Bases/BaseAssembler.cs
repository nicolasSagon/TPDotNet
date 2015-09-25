using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace TP03.Models.Assemblers.Bases
{
    public abstract class BaseAssembler<T>
    {
        public List<T> ConvertTo(DataRowCollection source)
        {
            if (source == null || source.Count == 0)
                return null;
            List<T> liste = new List<T>();
            foreach (DataRow dataRow in source)
                liste.Add(ConvertTo(dataRow));
            return liste;
        }

        public abstract T ConvertTo(DataRow source);
    }
}