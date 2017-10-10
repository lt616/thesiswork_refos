#ifndef _HOME_AXJLLT_DESKTOP_ORI_REFOS_BUILD_X86_PC99_LIBSEL4_INCLUDE_SEL4_TYPES_GEN_H
#define _HOME_AXJLLT_DESKTOP_ORI_REFOS_BUILD_X86_PC99_LIBSEL4_INCLUDE_SEL4_TYPES_GEN_H

#include <autoconf.h>
#include <sel4/simple_types.h>
#include <sel4/debug_assert.h>
struct seL4_CapData {
    seL4_Uint32 words[1];
};
typedef struct seL4_CapData seL4_CapData_t;

enum seL4_CapData_tag {
    seL4_CapData_Badge = 0,
    seL4_CapData_Guard = 1
};
typedef enum seL4_CapData_tag seL4_CapData_tag_t;

LIBSEL4_INLINE_FUNC seL4_Uint32 CONST
seL4_CapData_get_CapDataType(seL4_CapData_t seL4_CapData) {
    return (seL4_CapData.words[0] >> 31) & 0x1u;
}

LIBSEL4_INLINE_FUNC int CONST
seL4_CapData_CapDataType_equals(seL4_CapData_t seL4_CapData, seL4_Uint32 seL4_CapData_type_tag) {
    return ((seL4_CapData.words[0] >> 31) & 0x1u) == seL4_CapData_type_tag;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 PURE
seL4_CapData_ptr_get_CapDataType(seL4_CapData_t *seL4_CapData_ptr) {
    return (seL4_CapData_ptr->words[0] >> 31) & 0x1u;
}

LIBSEL4_INLINE_FUNC seL4_CapData_t CONST
seL4_CapData_Badge_new(seL4_Uint32 Badge) {
    seL4_CapData_t seL4_CapData;

    /* fail if user has passed bits that we will override */  
    seL4_DebugAssert(((seL4_Uint32)seL4_CapData_Badge & ~0x1u) == ((0 && ((seL4_Uint32)seL4_CapData_Badge & (1u << 31))) ? 0x0 : 0));  
    seL4_DebugAssert((Badge & ~0xfffffffu) == ((0 && (Badge & (1u << 31))) ? 0x0 : 0));

    seL4_CapData.words[0] = 0
        | ((seL4_Uint32)seL4_CapData_Badge & 0x1u) << 31
        | (Badge & 0xfffffffu) << 0;

    return seL4_CapData;
}

LIBSEL4_INLINE_FUNC void
seL4_CapData_Badge_ptr_new(seL4_CapData_t *seL4_CapData_ptr, seL4_Uint32 Badge) {
    /* fail if user has passed bits that we will override */  
    seL4_DebugAssert(((seL4_Uint32)seL4_CapData_Badge & ~0x1u) == ((0 && ((seL4_Uint32)seL4_CapData_Badge & (1u << 31))) ? 0x0 : 0));  
    seL4_DebugAssert((Badge & ~0xfffffffu) == ((0 && (Badge & (1u << 31))) ? 0x0 : 0));

    seL4_CapData_ptr->words[0] = 0
        | ((seL4_Uint32)seL4_CapData_Badge & 0x1u) << 31
        | (Badge & 0xfffffffu) << 0;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 CONST
seL4_CapData_Badge_get_Badge(seL4_CapData_t seL4_CapData) {
    seL4_Uint32 ret;
    seL4_DebugAssert(((seL4_CapData.words[0] >> 31) & 0x1) ==
           seL4_CapData_Badge);

    ret = (seL4_CapData.words[0] & 0xfffffffu) >> 0;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC seL4_CapData_t CONST
seL4_CapData_Badge_set_Badge(seL4_CapData_t seL4_CapData, seL4_Uint32 v32) {
    seL4_DebugAssert(((seL4_CapData.words[0] >> 31) & 0x1) ==
           seL4_CapData_Badge);
    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0xfffffffu >> 0 ) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));

    seL4_CapData.words[0] &= ~0xfffffffu;
    seL4_CapData.words[0] |= (v32 << 0) & 0xfffffffu;
    return seL4_CapData;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 PURE
seL4_CapData_Badge_ptr_get_Badge(seL4_CapData_t *seL4_CapData_ptr) {
    seL4_Uint32 ret;
    seL4_DebugAssert(((seL4_CapData_ptr->words[0] >> 31) & 0x1) ==
           seL4_CapData_Badge);

    ret = (seL4_CapData_ptr->words[0] & 0xfffffffu) >> 0;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC void
seL4_CapData_Badge_ptr_set_Badge(seL4_CapData_t *seL4_CapData_ptr,
                                      seL4_Uint32 v32) {
    seL4_DebugAssert(((seL4_CapData_ptr->words[0] >> 31) & 0x1) ==
           seL4_CapData_Badge);

    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0xfffffffu >> 0) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));

    seL4_CapData_ptr->words[0] &= ~0xfffffffu;
    seL4_CapData_ptr->words[0] |= (v32 << 0) & 0xfffffffu;
}

LIBSEL4_INLINE_FUNC seL4_CapData_t CONST
seL4_CapData_Guard_new(seL4_Uint32 GuardBits, seL4_Uint32 GuardSize) {
    seL4_CapData_t seL4_CapData;

    /* fail if user has passed bits that we will override */  
    seL4_DebugAssert(((seL4_Uint32)seL4_CapData_Guard & ~0x1u) == ((0 && ((seL4_Uint32)seL4_CapData_Guard & (1u << 31))) ? 0x0 : 0));  
    seL4_DebugAssert((GuardBits & ~0x3ffffu) == ((0 && (GuardBits & (1u << 31))) ? 0x0 : 0));  
    seL4_DebugAssert((GuardSize & ~0x1fu) == ((0 && (GuardSize & (1u << 31))) ? 0x0 : 0));

    seL4_CapData.words[0] = 0
        | ((seL4_Uint32)seL4_CapData_Guard & 0x1u) << 31
        | (GuardBits & 0x3ffffu) << 8
        | (GuardSize & 0x1fu) << 3;

    return seL4_CapData;
}

LIBSEL4_INLINE_FUNC void
seL4_CapData_Guard_ptr_new(seL4_CapData_t *seL4_CapData_ptr, seL4_Uint32 GuardBits, seL4_Uint32 GuardSize) {
    /* fail if user has passed bits that we will override */  
    seL4_DebugAssert(((seL4_Uint32)seL4_CapData_Guard & ~0x1u) == ((0 && ((seL4_Uint32)seL4_CapData_Guard & (1u << 31))) ? 0x0 : 0));  
    seL4_DebugAssert((GuardBits & ~0x3ffffu) == ((0 && (GuardBits & (1u << 31))) ? 0x0 : 0));  
    seL4_DebugAssert((GuardSize & ~0x1fu) == ((0 && (GuardSize & (1u << 31))) ? 0x0 : 0));

    seL4_CapData_ptr->words[0] = 0
        | ((seL4_Uint32)seL4_CapData_Guard & 0x1u) << 31
        | (GuardBits & 0x3ffffu) << 8
        | (GuardSize & 0x1fu) << 3;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 CONST
seL4_CapData_Guard_get_GuardBits(seL4_CapData_t seL4_CapData) {
    seL4_Uint32 ret;
    seL4_DebugAssert(((seL4_CapData.words[0] >> 31) & 0x1) ==
           seL4_CapData_Guard);

    ret = (seL4_CapData.words[0] & 0x3ffff00u) >> 8;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC seL4_CapData_t CONST
seL4_CapData_Guard_set_GuardBits(seL4_CapData_t seL4_CapData, seL4_Uint32 v32) {
    seL4_DebugAssert(((seL4_CapData.words[0] >> 31) & 0x1) ==
           seL4_CapData_Guard);
    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0x3ffff00u >> 8 ) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));

    seL4_CapData.words[0] &= ~0x3ffff00u;
    seL4_CapData.words[0] |= (v32 << 8) & 0x3ffff00u;
    return seL4_CapData;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 PURE
seL4_CapData_Guard_ptr_get_GuardBits(seL4_CapData_t *seL4_CapData_ptr) {
    seL4_Uint32 ret;
    seL4_DebugAssert(((seL4_CapData_ptr->words[0] >> 31) & 0x1) ==
           seL4_CapData_Guard);

    ret = (seL4_CapData_ptr->words[0] & 0x3ffff00u) >> 8;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC void
seL4_CapData_Guard_ptr_set_GuardBits(seL4_CapData_t *seL4_CapData_ptr,
                                      seL4_Uint32 v32) {
    seL4_DebugAssert(((seL4_CapData_ptr->words[0] >> 31) & 0x1) ==
           seL4_CapData_Guard);

    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0x3ffff00u >> 8) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));

    seL4_CapData_ptr->words[0] &= ~0x3ffff00u;
    seL4_CapData_ptr->words[0] |= (v32 << 8) & 0x3ffff00u;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 CONST
seL4_CapData_Guard_get_GuardSize(seL4_CapData_t seL4_CapData) {
    seL4_Uint32 ret;
    seL4_DebugAssert(((seL4_CapData.words[0] >> 31) & 0x1) ==
           seL4_CapData_Guard);

    ret = (seL4_CapData.words[0] & 0xf8u) >> 3;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC seL4_CapData_t CONST
seL4_CapData_Guard_set_GuardSize(seL4_CapData_t seL4_CapData, seL4_Uint32 v32) {
    seL4_DebugAssert(((seL4_CapData.words[0] >> 31) & 0x1) ==
           seL4_CapData_Guard);
    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0xf8u >> 3 ) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));

    seL4_CapData.words[0] &= ~0xf8u;
    seL4_CapData.words[0] |= (v32 << 3) & 0xf8u;
    return seL4_CapData;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 PURE
seL4_CapData_Guard_ptr_get_GuardSize(seL4_CapData_t *seL4_CapData_ptr) {
    seL4_Uint32 ret;
    seL4_DebugAssert(((seL4_CapData_ptr->words[0] >> 31) & 0x1) ==
           seL4_CapData_Guard);

    ret = (seL4_CapData_ptr->words[0] & 0xf8u) >> 3;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC void
seL4_CapData_Guard_ptr_set_GuardSize(seL4_CapData_t *seL4_CapData_ptr,
                                      seL4_Uint32 v32) {
    seL4_DebugAssert(((seL4_CapData_ptr->words[0] >> 31) & 0x1) ==
           seL4_CapData_Guard);

    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0xf8u >> 3) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));

    seL4_CapData_ptr->words[0] &= ~0xf8u;
    seL4_CapData_ptr->words[0] |= (v32 << 3) & 0xf8u;
}

#endif
