class Education < ActiveRecord::Base
  belongs_to :candidate

  extend FriendlyId
  friendly_id :slug_educations, use: :slugged

  YEAR = %W[2016 2015 2014 2013 2012 2011 2010 2009 2008 2007 2006 2005 2004 2003 2002 2001 2000 1999 1998 1997 1996 1995 1994 1993 1992 1991 1990 1989 1988 1987 1986 1985 1984 1983 1982 1981 1980]

  def slug_educations
    [
      :school,
      [:school, :degree],
      [:school, :degree, :year]
    ]
  end
end
