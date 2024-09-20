final class EmployeeService {
  Future<Map> get() async {
    return {
      "employees": [
        {
          "firstname": "John",
          "lastname": "Doe",
          "dateofbirth": "1985-06-14",
          "yearofemployment": "2010-07-12"
        },
        {
          "firstname": "Mavis",
          "lastname": "Beacon",
          "dateofbirth": "1985-08-09",
          "yearofemployment": "2021-03-31"
        },
        {
          "firstname": "Joel",
          "lastname": "Essien",
          "dateofbirth": "1991-02-19",
          "yearofemployment": "2014-02-29"
        },
        {
          "firstname": "Sam",
          "lastname": "Bellow",
          "dateofbirth": "1991-10-03",
          "yearofemployment": "2014-11-25"
        },
        {
          "firstname": "Jane",
          "lastname": "Smith",
          "dateofbirth": "2002-09-30",
          "yearofemployment": "2015-01-23"
        }
      ]
    };
  }
}
