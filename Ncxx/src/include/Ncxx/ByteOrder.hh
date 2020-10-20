// *=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=* 
// ** Copyright UCAR (c) 1990 - 2016                                         
// ** University Corporation for Atmospheric Research (UCAR)                 
// ** National Center for Atmospheric Research (NCAR)                        
// ** Boulder, Colorado, USA                                                 
// ** BSD licence applies - redistribution and use in source and binary      
// ** forms, with or without modification, are permitted provided that       
// ** the following conditions are met:                                      
// ** 1) If the software is modified to produce derivative works,            
// ** such modified software should be clearly marked, so as not             
// ** to confuse it with the version available from UCAR.                    
// ** 2) Redistributions of source code must retain the above copyright      
// ** notice, this list of conditions and the following disclaimer.          
// ** 3) Redistributions in binary form must reproduce the above copyright   
// ** notice, this list of conditions and the following disclaimer in the    
// ** documentation and/or other materials provided with the distribution.   
// ** 4) Neither the name of UCAR nor the names of its contributors,         
// ** if any, may be used to endorse or promote products derived from        
// ** this software without specific prior written permission.               
// ** DISCLAIMER: THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS  
// ** OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED      
// ** WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.    
// *=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=* 
/////////////////////////////////////////////////////////////
// ByteOrder.hh
//
// Byte ordering utilities for Radx
//
// Mike Dixon, RAP, NCAR
// P.O.Box 3000, Boulder, CO, 80307-3000, USA
//
// Feb 2010
//
///////////////////////////////////////////////////////////////

#ifndef ByteOrder_HH
#define ByteOrder_HH

#include <cstdlib>
using namespace std;

//////////////////////////////////////////////////////////////////////
/// CLASS FOR MANIPULATING BYTE ORDERING
/// 
/// This module comprises routines to convert integers and floating
/// point values between the native machine format and big-endian
/// format.
///
/// Big endian format assigns lower order bytes to memory with larger
/// addresses. For example, if the number 1 is to be stored using a
/// two-byte big-endian integer, it would be represented as:
/// 
/// \code 
///    address n+1      address n
///       00000001       00000000
/// \endcode 
/// 
/// In little-endian format, the same number (1) would be stored as:
/// 
/// \code 
///    address n+1      address n
///       00000000       00000001
/// \endcode 
/// 
/// The strategy of this module is to provide tools for machine
/// independent byte storage. The routines were designed for
/// efficiency, utility and portability. They do not pad but assume
/// that different types will be converted in-place using the
/// appropriate fixed storage sizes.
///
/// In order to use these routines, one needs to determine which C
/// integer types on the underlying machine have 8 bits, 16 bits and
/// 32 bits. On current machines the following generally apply:
/// 
/// \code 
///   char   -> 1 byte
///   short  -> 2 bytes
///   int    -> 4 bytes
///   long   -> 4 bytes or 8 bytes
///   float  -> 4 bytes
///   double -> 8 bytes
/// \endcode 
/// 
/// ByteOrder assumes that the floating point implementation is
/// identical (IEEE) on all machines, except for byte ordering.

class ByteOrder {

public:

  //////////////////////////////////////////////////////////////////////////
  /// Determine whether the host is bigendian or not
  /// Returns TRUE if big-endian

  static bool hostIsBigEndian();

  //////////////////////////////////////////////////////////////////////////
  /// Perform an in-place 64-bit word byte swap, if necessary, to produce
  /// BE representation from machine representation, or vice-versa.
  /// 
  /// If force is true, swapping is forced irrespective of host byte order.
  /// 
  /// Array must be aligned on an 8-byte boundary in memory.
  /// 
  /// Returns the number of bytes converted, 0 if no swapping is performed.
  
  static int swap64(void *array, size_t nbytes, bool force = false);
  
  //////////////////////////////////////////////////////////////////////////
  /// Performs an in-place 32-bit word byte swap, if necessary, to produce
  /// BE representation from machine representation, or vice-versa.
  /// 
  /// If force is true, swapping is forced irrespective of host byte order.
  /// 
  /// Array must be aligned on an 4-byte boundary in memory.
  /// 
  /// Returns the number of bytes converted, 0 if no swapping is performed.
  
  static int swap32(void *array, size_t nbytes, bool force = false);
  
  //////////////////////////////////////////////////////////////////////////
  /// Performs an in-place 16-bit word byte swap, if necessary, to produce
  /// BE representation from machine representation, or vice-versa.
  ///
  /// If force is true, swapping is forced irrespective of host byte order.
  /// 
  /// Array must be aligned on an 2-byte boundary in memory.
  /// 
  /// Returns the number of bytes converted, 0 if no swapping is performed.
  
  static int swap16(void *array, size_t nbytes, bool force = false);

private:

  static bool _set;
  static bool _isBigEndian;

};

# endif
