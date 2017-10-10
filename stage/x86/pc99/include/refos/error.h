/*
 * Copyright 2016, Data61
 * Commonwealth Scientific and Industrial Research Organisation (CSIRO)
 * ABN 41 687 119 230.
 *
 * This software may be distributed and modified according to the terms of
 * the BSD 2-Clause license. Note that NO WARRANTY is provided.
 * See "LICENSE_BSD2.txt" for details.
 *
 * @TAG(D61_BSD)
 */

#ifndef _REFOS_ERROR_H_
#define _REFOS_ERROR_H_

/* Include Kconfig variables. */
#include <autoconf.h>
#include <errno.h>

typedef enum __refos_errors {
	ESUCCESS = 0,
	EINVALID = EHWPOISON + 1,
	EUNKNOWNCLIENT,
	EINVALIDPARAM,
	ESERVERNOTFOUND,
	EINVALIDWINDOW,
	ESERVICEUNAVAILABLE,
	EACCESSDENIED,
	EUNMAPFIRST,
	EFILENOTFOUND,
	EENDOFFILE,
	EDEVICENOTFOUND,
	ENOPARAMBUFFER,
	EUNIMPLEMENTED,
	EDELEGATED
} refos_err_t;

/*! @file
    @brief RefOS Error codes.
    
    Shared error codes for RefOS methods.
*/

/*! @brief Helper function which returns the associated string with a RefOS error number. Useful for
           printing debugging information.
    @param err The RefOS error.
    @return Static string containing the error variable enum name. (No ownership transfer)
*/
static inline const char*
refos_error_str(refos_err_t _err)
{
    int err = (int)_err;
    switch (err) {
        case ESUCCESS:
            return "ESUCCESS";
        case ENOMEM:
            return "ENOMEM";
        case EINVALID:
            return "EINVALID";
        case EUNKNOWNCLIENT:
            return "EUNKNOWNCLIENT";
        case EINVALIDPARAM:
            return "EINVALIDPARAM";
        case ESERVERNOTFOUND:
            return "ESERVERNOTFOUND";
        case EINVALIDWINDOW:
            return "EINVALIDWINDOW";
        case ESERVICEUNAVAILABLE:
            return "ESERVICEUNAVAILABLE";
        case EACCESSDENIED:
            return "EACCESSDENIED";
        case EUNMAPFIRST:
            return "EUNMAPFIRST";
        case EFILENOTFOUND:
            return "EFILENOTFOUND";
        case EENDOFFILE:
            return "EENDOFFILE";
        case EDEVICENOTFOUND:
            return "EDEVICENOTFOUND";
        case ENOPARAMBUFFER:
            return "ENOPARAMBUFFER";
        case EUNIMPLEMENTED:
            return "EUNIMPLEMENTED";
        case EDELEGATED:
            return "EDELEGATED";
        default:
            return "EUNKNOWNERROR";
    }
    return (const char*) 0;
}

#include <sel4/errors.h>

/*! @brief Helper function to return the enum name string associated with a seL4 error.
    @param sel4err The seL4 error number.
    @return Static str containing the string name of the given error code. (No ownership transfer)
*/
static inline const char*
seL4_error_str(int sel4err)
{
    switch (sel4err) {
        case seL4_NoError:
            return "seL4_NoError";
        case seL4_InvalidArgument:
            return "seL4_InvalidArgument";
        case seL4_InvalidCapability:
            return "seL4_InvalidCapability";
        case seL4_IllegalOperation:
            return "seL4_IllegalOperation";
        case seL4_RangeError:
            return "seL4_RangeError";
        case seL4_AlignmentError:
            return "seL4_AlignmentError";
        case seL4_FailedLookup:
            return "seL4_FailedLookup";
        case seL4_TruncatedMessage:
            return "seL4_TruncatedMessage";
        case seL4_DeleteFirst:
            return "seL4_DeleteFirst";
        case seL4_RevokeFirst:
            return "seL4_RevokeFirst";
        case seL4_NotEnoughMemory:
            return "seL4_NotEnoughMemory";
        default:
            return "Unknown seL4 Error.";
    }
};

extern refos_err_t _refos_errno;

#if CONFIG_REFOS_HALT_ON_ERRNO
    #define REFOS_SET_ERRNO(x) _refos_errno = x; if (_refos_errno != ESUCCESS) \
        {\
            printf("REFOS call generated error in file %s line %d", __FILE__, __LINE__);\
            assert(!"Halt because REFOS_HALT_ON_ERRNO is enabled.");\
            while(1);\
        }
    #define REFOS_GET_ERRNO() (_refos_errno)
#else
    #define REFOS_SET_ERRNO(x) (_refos_errno = x)
    #define REFOS_GET_ERRNO() (_refos_errno)
#endif
#define ROS_ERRNO REFOS_GET_ERRNO
#define ROS_SET_ERRNO REFOS_SET_ERRNO

#endif /* _REFOS_ERROR_H_ */
