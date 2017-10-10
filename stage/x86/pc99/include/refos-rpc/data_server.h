/* DO NOT EDIT MANUALLY!!!
   This file was generated by CIDL.

   Copyright 2016, Data61
   Commonwealth Scientific and Industrial Research Organisation (CSIRO)
   ABN 41 687 119 230.

   This software may be distributed and modified according to the terms of
   the BSD 2-Clause license. Note that NO WARRANTY is provided.
   See "LICENSE_BSD2.txt" for details.

   @TAG(D61_BSD)
*/

#ifndef _RPC_INTERFACE_DATA_SERVER_H_
#define _RPC_INTERFACE_DATA_SERVER_H_

#include <refos-rpc/rpc.h>
#include <refos/refos.h>

#include <refos/vmlayout.h>

#include <sys/types.h>


/*! @file
    @brief Generated file for the data interface. Please do NOT edit this file. */

#ifndef _RPC_DATA_LABEL_ENUMS_
#define _RPC_DATA_LABEL_ENUMS_
/*! @brief RPC syscall label enums for data interface. */
enum rpc_data_label_enum {
    RPC_DATA_LABEL_MIN = DATASERV_METHODS_BASE,
    RPC_DATA_OPEN,
    RPC_DATA_CLOSE,
    RPC_DATA_READ,
    RPC_DATA_WRITE,
    RPC_DATA_GETC,
    RPC_DATA_PUTC,
    RPC_DATA_LSEEK,
    RPC_DATA_GET_SIZE,
    RPC_DATA_EXPAND,
    RPC_DATA_DATAMAP,
    RPC_DATA_DATAUNMAP,
    RPC_DATA_INIT_DATA,
    RPC_DATA_HAVE_DATA,
    RPC_DATA_UNHAVE_DATA,
    RPC_DATA_PROVIDE_DATA_FROM_PARAMBUFFER,
    RPC_DATA_LABEL_MAX
};
#endif

void server_data_open(void *rpc_userptr);
void reply_data_open(void *rpc_userptr, int* rpc__errno, seL4_CPtr rpc___ret__);
extern seL4_CPtr data_open_handler(void *rpc_userptr , char* rpc_name , int rpc_flags , int rpc_mode , int rpc_size , int* rpc__errno) __attribute__((weak));

void server_data_close(void *rpc_userptr);
void reply_data_close(void *rpc_userptr, refos_err_t rpc___ret__);
extern refos_err_t data_close_handler(void *rpc_userptr , seL4_CPtr rpc_dspace_fd) __attribute__((weak));

void server_data_read(void *rpc_userptr);
void reply_data_read(void *rpc_userptr, rpc_buffer_t rpc_buf, int rpc___ret__);
extern int data_read_handler(void *rpc_userptr , seL4_CPtr rpc_dspace_fd , uint32_t rpc_offset , rpc_buffer_t rpc_buf , uint32_t rpc_count) __attribute__((weak));

void server_data_write(void *rpc_userptr);
void reply_data_write(void *rpc_userptr, int rpc___ret__);
extern int data_write_handler(void *rpc_userptr , seL4_CPtr rpc_dspace_fd , uint32_t rpc_offset , rpc_buffer_t rpc_buf , uint32_t rpc_count) __attribute__((weak));

void server_data_getc(void *rpc_userptr);
void reply_data_getc(void *rpc_userptr, int rpc___ret__);
extern int data_getc_handler(void *rpc_userptr , seL4_CPtr rpc_dspace_fd , int rpc_block) __attribute__((weak));

void server_data_putc(void *rpc_userptr);
void reply_data_putc(void *rpc_userptr, refos_err_t rpc___ret__);
extern refos_err_t data_putc_handler(void *rpc_userptr , seL4_CPtr rpc_dspace_fd , int rpc_c) __attribute__((weak));

void server_data_lseek(void *rpc_userptr);
void reply_data_lseek(void *rpc_userptr, off_t rpc___ret__);
extern off_t data_lseek_handler(void *rpc_userptr , seL4_CPtr rpc_dspace_fd , off_t rpc_offset , int rpc_whence) __attribute__((weak));

void server_data_get_size(void *rpc_userptr);
void reply_data_get_size(void *rpc_userptr, uint32_t rpc___ret__);
extern uint32_t data_get_size_handler(void *rpc_userptr , seL4_CPtr rpc_dspace_fd) __attribute__((weak));

void server_data_expand(void *rpc_userptr);
void reply_data_expand(void *rpc_userptr, refos_err_t rpc___ret__);
extern refos_err_t data_expand_handler(void *rpc_userptr , seL4_CPtr rpc_dspace_fd , uint32_t rpc_size) __attribute__((weak));

void server_data_datamap(void *rpc_userptr);
void reply_data_datamap(void *rpc_userptr, refos_err_t rpc___ret__);
extern refos_err_t data_datamap_handler(void *rpc_userptr , seL4_CPtr rpc_dspace_fd , seL4_CPtr rpc_memoryWindow , uint32_t rpc_offset) __attribute__((weak));

void server_data_dataunmap(void *rpc_userptr);
void reply_data_dataunmap(void *rpc_userptr, refos_err_t rpc___ret__);
extern refos_err_t data_dataunmap_handler(void *rpc_userptr , seL4_CPtr rpc_memoryWindow) __attribute__((weak));

void server_data_init_data(void *rpc_userptr);
void reply_data_init_data(void *rpc_userptr, refos_err_t rpc___ret__);
extern refos_err_t data_init_data_handler(void *rpc_userptr , seL4_CPtr rpc_destDataspace , seL4_CPtr rpc_srcDataspace , uint32_t rpc_srcDataspaceOffset) __attribute__((weak));

void server_data_have_data(void *rpc_userptr);
void reply_data_have_data(void *rpc_userptr, uint32_t* rpc_dataID, refos_err_t rpc___ret__);
extern refos_err_t data_have_data_handler(void *rpc_userptr , seL4_CPtr rpc_dspace_fd , seL4_CPtr rpc_faultNotifyEP , uint32_t* rpc_dataID) __attribute__((weak));

void server_data_unhave_data(void *rpc_userptr);
void reply_data_unhave_data(void *rpc_userptr, refos_err_t rpc___ret__);
extern refos_err_t data_unhave_data_handler(void *rpc_userptr , seL4_CPtr rpc_dspace_fd) __attribute__((weak));

void server_data_provide_data_from_parambuffer(void *rpc_userptr);
void reply_data_provide_data_from_parambuffer(void *rpc_userptr, refos_err_t rpc___ret__);
extern refos_err_t data_provide_data_from_parambuffer_handler(void *rpc_userptr , seL4_CPtr rpc_dspace_fd , uint32_t rpc_offset , uint32_t rpc_contentSize) __attribute__((weak));

#endif /* _RPC_INTERFACE_DATA_SERVER_H_ */

