using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP01WPF.Business.Assemblers.Base
{
    public abstract class BaseAssembler<S, T>
    {

        public abstract T ConvertTo(S source);

        public List<T> ConvertTo(List<S> source)
        {
            if (source == null || source.Count == 0)
                return null;
            else
                return source.Select(o => this.ConvertTo(o)).ToList();
        }
    }
}
