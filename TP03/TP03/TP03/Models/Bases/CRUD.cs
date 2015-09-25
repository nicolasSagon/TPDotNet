using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP03.Models.Bases
{
    public interface CRUD<T>
    {

        int Create(T t);

        bool Update(T t);

        bool Delete(int id);
        List<T> ReadAll();
        T ReadOne(int id);

    }
}
