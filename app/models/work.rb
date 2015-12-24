class Work < ActiveRecord::Base
  belongs_to :candidate

  extend FriendlyId
  friendly_id :slug_works, use: :slugged

  STATUS = ["CURRENT", "PAST"]
  START_MONTH = %w[JAN FEB MAR APR MAY JUN JULY AUG SEP OCT NOV DEC]
  END_MONTH = %w[JAN FEB MAR APR MAY JUN JULY AUG SEP OCT NOV DEC]
  START_YEAR = %W[2016 2015 2014 2013 2012 2011 2010 2009 2008 2007 2006 2005 2004 2003 2002 2001 2000 1999 1998 1997 1996 1995 1994 1993 1992 1991 1990 1989 1988 1987 1986 1985 1984 1983 1982 1981 1980]
  END_YEAR = %W[2016 2015 2014 2013 2012 2011 2010 2009 2008 2007 2006 2005 2004 2003 2002 2001 2000 1999 1998 1997 1996 1995 1994 1993 1992 1991 1990 1989 1988 1987 1986 1985 1984 1983 1982 1981 1980]

  def slug_works
    [
      :company,
      [:company, :position],
      [:company, :position, :status,],
      [:company, :position, :status, :start_year,],
      [:company, :position, :status, :end_year]
    ]
  end
end
