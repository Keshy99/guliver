enum VehicleType { private, public }

enum ModeOfInsurance { payPerTrip, payPerMonthOdometer }

extension ModeOfInsuranceExtension on ModeOfInsurance {
  String get description {
    switch (this) {
      case ModeOfInsurance.payPerTrip:
        return 'Pay per trip';
      case ModeOfInsurance.payPerMonthOdometer:
        return 'Pay per month(Odometer)';
      default:
        return '';
    }
  }
}

enum VehicleYear {
  year1990,
  year1991,
  year1992,
  year1993,
  year1994,
  year1995,
  year1996,
  year1997,
  year1998,
  year1999,
  year2000,
  year2001,
  year2002,
  year2003,
  year2004,
  year2005,
  year2006,
  year2007,
  year2008,
  year2009,
  year2010,
  year2011,
  year2012,
  year2013,
  year2014,
  year2015,
  year2016,
  year2017,
  year2018,
  year2019,
  year2020,
  year2021,
  year2022,
  year2023,
  year2024,
  year2025,
  year2026,
  year2027,
  year2028,
  year2029
}
