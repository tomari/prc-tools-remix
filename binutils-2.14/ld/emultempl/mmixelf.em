# This shell script emits a C file. -*- C -*-
#   Copyright 2001, 2002 Free Software Foundation, Inc.
#
# This file is part of GLD, the Gnu Linker.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
#

# This file is sourced from elf32.em and used to define MMIX and ELF
# specific things.  First include what we have in common with mmo.

. ${srcdir}/emultempl/mmix-elfnmmo.em

cat >>e${EMULATION_NAME}.c <<EOF
#line 29 "${srcdir}/emultempl/elfmmix.em"

static void elfmmix_before_parse PARAMS ((void));

static void
elfmmix_before_parse ()
{
  gld${EMULATION_NAME}_before_parse ();

  /* Make sure we don't create a demand-paged executable.  Unfortunately
     this isn't changeable with a command-line option.  It makes no
     difference to mmo, but the sections in elf64mmix will be aligned to a
     page in the linked file, which is non-intuitive.  If there's ever a
     full system with shared libraries and demand paging, you will want to
     exclude this file.  */
  config.magic_demand_paged = FALSE;
}
EOF

LDEMUL_BEFORE_PARSE=elfmmix_before_parse
