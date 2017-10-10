#ifndef _HOME_AXJLLT_DESKTOP_ORI_REFOS_BUILD_X86_PC99_LIBSEL4_INCLUDE_SEL4_SHARED_TYPES_GEN_H
#define _HOME_AXJLLT_DESKTOP_ORI_REFOS_BUILD_X86_PC99_LIBSEL4_INCLUDE_SEL4_SHARED_TYPES_GEN_H

#include <autoconf.h>
#include <sel4/simple_types.h>
#include <sel4/debug_assert.h>
struct seL4_PrioProps {
    seL4_Uint32 words[1];
};
typedef struct seL4_PrioProps seL4_PrioProps_t;

LIBSEL4_INLINE_FUNC seL4_PrioProps_t CONST
seL4_PrioProps_new(seL4_Uint32 mcp, seL4_Uint32 prio) {
    seL4_PrioProps_t seL4_PrioProps;

    /* fail if user has passed bits that we will override */  
    seL4_DebugAssert((mcp & ~0xffu) == ((0 && (mcp & (1u << 31))) ? 0x0 : 0));  
    seL4_DebugAssert((prio & ~0xffu) == ((0 && (prio & (1u << 31))) ? 0x0 : 0));

    seL4_PrioProps.words[0] = 0
        | (mcp & 0xffu) << 8
        | (prio & 0xffu) << 0;

    return seL4_PrioProps;
}

LIBSEL4_INLINE_FUNC void
seL4_PrioProps_ptr_new(seL4_PrioProps_t *seL4_PrioProps_ptr, seL4_Uint32 mcp, seL4_Uint32 prio) {
    /* fail if user has passed bits that we will override */  
    seL4_DebugAssert((mcp & ~0xffu) == ((0 && (mcp & (1u << 31))) ? 0x0 : 0));  
    seL4_DebugAssert((prio & ~0xffu) == ((0 && (prio & (1u << 31))) ? 0x0 : 0));

    seL4_PrioProps_ptr->words[0] = 0
        | (mcp & 0xffu) << 8
        | (prio & 0xffu) << 0;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 CONST
seL4_PrioProps_get_mcp(seL4_PrioProps_t seL4_PrioProps) {
    seL4_Uint32 ret;
    ret = (seL4_PrioProps.words[0] & 0xff00u) >> 8;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC seL4_PrioProps_t CONST
seL4_PrioProps_set_mcp(seL4_PrioProps_t seL4_PrioProps, seL4_Uint32 v32) {
    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0xff00 >> 8 ) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));
    seL4_PrioProps.words[0] &= ~0xff00u;
    seL4_PrioProps.words[0] |= (v32 << 8) & 0xff00u;
    return seL4_PrioProps;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 PURE
seL4_PrioProps_ptr_get_mcp(seL4_PrioProps_t *seL4_PrioProps_ptr) {
    seL4_Uint32 ret;
    ret = (seL4_PrioProps_ptr->words[0] & 0xff00u) >> 8;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC void
seL4_PrioProps_ptr_set_mcp(seL4_PrioProps_t *seL4_PrioProps_ptr, seL4_Uint32 v32) {
    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0xff00 >> 8) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));
    seL4_PrioProps_ptr->words[0] &= ~0xff00u;
    seL4_PrioProps_ptr->words[0] |= (v32 << 8) & 0xff00;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 CONST
seL4_PrioProps_get_prio(seL4_PrioProps_t seL4_PrioProps) {
    seL4_Uint32 ret;
    ret = (seL4_PrioProps.words[0] & 0xffu) >> 0;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC seL4_PrioProps_t CONST
seL4_PrioProps_set_prio(seL4_PrioProps_t seL4_PrioProps, seL4_Uint32 v32) {
    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0xff >> 0 ) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));
    seL4_PrioProps.words[0] &= ~0xffu;
    seL4_PrioProps.words[0] |= (v32 << 0) & 0xffu;
    return seL4_PrioProps;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 PURE
seL4_PrioProps_ptr_get_prio(seL4_PrioProps_t *seL4_PrioProps_ptr) {
    seL4_Uint32 ret;
    ret = (seL4_PrioProps_ptr->words[0] & 0xffu) >> 0;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC void
seL4_PrioProps_ptr_set_prio(seL4_PrioProps_t *seL4_PrioProps_ptr, seL4_Uint32 v32) {
    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0xff >> 0) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));
    seL4_PrioProps_ptr->words[0] &= ~0xffu;
    seL4_PrioProps_ptr->words[0] |= (v32 << 0) & 0xff;
}

struct seL4_MessageInfo {
    seL4_Uint32 words[1];
};
typedef struct seL4_MessageInfo seL4_MessageInfo_t;

LIBSEL4_INLINE_FUNC seL4_MessageInfo_t CONST
seL4_MessageInfo_new(seL4_Uint32 label, seL4_Uint32 capsUnwrapped, seL4_Uint32 extraCaps, seL4_Uint32 length) {
    seL4_MessageInfo_t seL4_MessageInfo;

    /* fail if user has passed bits that we will override */  
    seL4_DebugAssert((label & ~0xfffffu) == ((0 && (label & (1u << 31))) ? 0x0 : 0));  
    seL4_DebugAssert((capsUnwrapped & ~0x7u) == ((0 && (capsUnwrapped & (1u << 31))) ? 0x0 : 0));  
    seL4_DebugAssert((extraCaps & ~0x3u) == ((0 && (extraCaps & (1u << 31))) ? 0x0 : 0));  
    seL4_DebugAssert((length & ~0x7fu) == ((0 && (length & (1u << 31))) ? 0x0 : 0));

    seL4_MessageInfo.words[0] = 0
        | (label & 0xfffffu) << 12
        | (capsUnwrapped & 0x7u) << 9
        | (extraCaps & 0x3u) << 7
        | (length & 0x7fu) << 0;

    return seL4_MessageInfo;
}

LIBSEL4_INLINE_FUNC void
seL4_MessageInfo_ptr_new(seL4_MessageInfo_t *seL4_MessageInfo_ptr, seL4_Uint32 label, seL4_Uint32 capsUnwrapped, seL4_Uint32 extraCaps, seL4_Uint32 length) {
    /* fail if user has passed bits that we will override */  
    seL4_DebugAssert((label & ~0xfffffu) == ((0 && (label & (1u << 31))) ? 0x0 : 0));  
    seL4_DebugAssert((capsUnwrapped & ~0x7u) == ((0 && (capsUnwrapped & (1u << 31))) ? 0x0 : 0));  
    seL4_DebugAssert((extraCaps & ~0x3u) == ((0 && (extraCaps & (1u << 31))) ? 0x0 : 0));  
    seL4_DebugAssert((length & ~0x7fu) == ((0 && (length & (1u << 31))) ? 0x0 : 0));

    seL4_MessageInfo_ptr->words[0] = 0
        | (label & 0xfffffu) << 12
        | (capsUnwrapped & 0x7u) << 9
        | (extraCaps & 0x3u) << 7
        | (length & 0x7fu) << 0;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 CONST
seL4_MessageInfo_get_label(seL4_MessageInfo_t seL4_MessageInfo) {
    seL4_Uint32 ret;
    ret = (seL4_MessageInfo.words[0] & 0xfffff000u) >> 12;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC seL4_MessageInfo_t CONST
seL4_MessageInfo_set_label(seL4_MessageInfo_t seL4_MessageInfo, seL4_Uint32 v32) {
    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0xfffff000 >> 12 ) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));
    seL4_MessageInfo.words[0] &= ~0xfffff000u;
    seL4_MessageInfo.words[0] |= (v32 << 12) & 0xfffff000u;
    return seL4_MessageInfo;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 PURE
seL4_MessageInfo_ptr_get_label(seL4_MessageInfo_t *seL4_MessageInfo_ptr) {
    seL4_Uint32 ret;
    ret = (seL4_MessageInfo_ptr->words[0] & 0xfffff000u) >> 12;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC void
seL4_MessageInfo_ptr_set_label(seL4_MessageInfo_t *seL4_MessageInfo_ptr, seL4_Uint32 v32) {
    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0xfffff000 >> 12) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));
    seL4_MessageInfo_ptr->words[0] &= ~0xfffff000u;
    seL4_MessageInfo_ptr->words[0] |= (v32 << 12) & 0xfffff000;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 CONST
seL4_MessageInfo_get_capsUnwrapped(seL4_MessageInfo_t seL4_MessageInfo) {
    seL4_Uint32 ret;
    ret = (seL4_MessageInfo.words[0] & 0xe00u) >> 9;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC seL4_MessageInfo_t CONST
seL4_MessageInfo_set_capsUnwrapped(seL4_MessageInfo_t seL4_MessageInfo, seL4_Uint32 v32) {
    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0xe00 >> 9 ) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));
    seL4_MessageInfo.words[0] &= ~0xe00u;
    seL4_MessageInfo.words[0] |= (v32 << 9) & 0xe00u;
    return seL4_MessageInfo;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 PURE
seL4_MessageInfo_ptr_get_capsUnwrapped(seL4_MessageInfo_t *seL4_MessageInfo_ptr) {
    seL4_Uint32 ret;
    ret = (seL4_MessageInfo_ptr->words[0] & 0xe00u) >> 9;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC void
seL4_MessageInfo_ptr_set_capsUnwrapped(seL4_MessageInfo_t *seL4_MessageInfo_ptr, seL4_Uint32 v32) {
    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0xe00 >> 9) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));
    seL4_MessageInfo_ptr->words[0] &= ~0xe00u;
    seL4_MessageInfo_ptr->words[0] |= (v32 << 9) & 0xe00;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 CONST
seL4_MessageInfo_get_extraCaps(seL4_MessageInfo_t seL4_MessageInfo) {
    seL4_Uint32 ret;
    ret = (seL4_MessageInfo.words[0] & 0x180u) >> 7;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC seL4_MessageInfo_t CONST
seL4_MessageInfo_set_extraCaps(seL4_MessageInfo_t seL4_MessageInfo, seL4_Uint32 v32) {
    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0x180 >> 7 ) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));
    seL4_MessageInfo.words[0] &= ~0x180u;
    seL4_MessageInfo.words[0] |= (v32 << 7) & 0x180u;
    return seL4_MessageInfo;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 PURE
seL4_MessageInfo_ptr_get_extraCaps(seL4_MessageInfo_t *seL4_MessageInfo_ptr) {
    seL4_Uint32 ret;
    ret = (seL4_MessageInfo_ptr->words[0] & 0x180u) >> 7;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC void
seL4_MessageInfo_ptr_set_extraCaps(seL4_MessageInfo_t *seL4_MessageInfo_ptr, seL4_Uint32 v32) {
    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0x180 >> 7) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));
    seL4_MessageInfo_ptr->words[0] &= ~0x180u;
    seL4_MessageInfo_ptr->words[0] |= (v32 << 7) & 0x180;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 CONST
seL4_MessageInfo_get_length(seL4_MessageInfo_t seL4_MessageInfo) {
    seL4_Uint32 ret;
    ret = (seL4_MessageInfo.words[0] & 0x7fu) >> 0;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC seL4_MessageInfo_t CONST
seL4_MessageInfo_set_length(seL4_MessageInfo_t seL4_MessageInfo, seL4_Uint32 v32) {
    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0x7f >> 0 ) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));
    seL4_MessageInfo.words[0] &= ~0x7fu;
    seL4_MessageInfo.words[0] |= (v32 << 0) & 0x7fu;
    return seL4_MessageInfo;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 PURE
seL4_MessageInfo_ptr_get_length(seL4_MessageInfo_t *seL4_MessageInfo_ptr) {
    seL4_Uint32 ret;
    ret = (seL4_MessageInfo_ptr->words[0] & 0x7fu) >> 0;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC void
seL4_MessageInfo_ptr_set_length(seL4_MessageInfo_t *seL4_MessageInfo_ptr, seL4_Uint32 v32) {
    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0x7f >> 0) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));
    seL4_MessageInfo_ptr->words[0] &= ~0x7fu;
    seL4_MessageInfo_ptr->words[0] |= (v32 << 0) & 0x7f;
}

struct seL4_CapRights {
    seL4_Uint32 words[1];
};
typedef struct seL4_CapRights seL4_CapRights_t;

LIBSEL4_INLINE_FUNC seL4_CapRights_t CONST
seL4_CapRights_new(seL4_Uint32 capAllowGrant, seL4_Uint32 capAllowRead, seL4_Uint32 capAllowWrite) {
    seL4_CapRights_t seL4_CapRights;

    /* fail if user has passed bits that we will override */  
    seL4_DebugAssert((capAllowGrant & ~0x1u) == ((0 && (capAllowGrant & (1u << 31))) ? 0x0 : 0));  
    seL4_DebugAssert((capAllowRead & ~0x1u) == ((0 && (capAllowRead & (1u << 31))) ? 0x0 : 0));  
    seL4_DebugAssert((capAllowWrite & ~0x1u) == ((0 && (capAllowWrite & (1u << 31))) ? 0x0 : 0));

    seL4_CapRights.words[0] = 0
        | (capAllowGrant & 0x1u) << 2
        | (capAllowRead & 0x1u) << 1
        | (capAllowWrite & 0x1u) << 0;

    return seL4_CapRights;
}

LIBSEL4_INLINE_FUNC void
seL4_CapRights_ptr_new(seL4_CapRights_t *seL4_CapRights_ptr, seL4_Uint32 capAllowGrant, seL4_Uint32 capAllowRead, seL4_Uint32 capAllowWrite) {
    /* fail if user has passed bits that we will override */  
    seL4_DebugAssert((capAllowGrant & ~0x1u) == ((0 && (capAllowGrant & (1u << 31))) ? 0x0 : 0));  
    seL4_DebugAssert((capAllowRead & ~0x1u) == ((0 && (capAllowRead & (1u << 31))) ? 0x0 : 0));  
    seL4_DebugAssert((capAllowWrite & ~0x1u) == ((0 && (capAllowWrite & (1u << 31))) ? 0x0 : 0));

    seL4_CapRights_ptr->words[0] = 0
        | (capAllowGrant & 0x1u) << 2
        | (capAllowRead & 0x1u) << 1
        | (capAllowWrite & 0x1u) << 0;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 CONST
seL4_CapRights_get_capAllowGrant(seL4_CapRights_t seL4_CapRights) {
    seL4_Uint32 ret;
    ret = (seL4_CapRights.words[0] & 0x4u) >> 2;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC seL4_CapRights_t CONST
seL4_CapRights_set_capAllowGrant(seL4_CapRights_t seL4_CapRights, seL4_Uint32 v32) {
    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0x4 >> 2 ) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));
    seL4_CapRights.words[0] &= ~0x4u;
    seL4_CapRights.words[0] |= (v32 << 2) & 0x4u;
    return seL4_CapRights;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 PURE
seL4_CapRights_ptr_get_capAllowGrant(seL4_CapRights_t *seL4_CapRights_ptr) {
    seL4_Uint32 ret;
    ret = (seL4_CapRights_ptr->words[0] & 0x4u) >> 2;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC void
seL4_CapRights_ptr_set_capAllowGrant(seL4_CapRights_t *seL4_CapRights_ptr, seL4_Uint32 v32) {
    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0x4 >> 2) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));
    seL4_CapRights_ptr->words[0] &= ~0x4u;
    seL4_CapRights_ptr->words[0] |= (v32 << 2) & 0x4;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 CONST
seL4_CapRights_get_capAllowRead(seL4_CapRights_t seL4_CapRights) {
    seL4_Uint32 ret;
    ret = (seL4_CapRights.words[0] & 0x2u) >> 1;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC seL4_CapRights_t CONST
seL4_CapRights_set_capAllowRead(seL4_CapRights_t seL4_CapRights, seL4_Uint32 v32) {
    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0x2 >> 1 ) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));
    seL4_CapRights.words[0] &= ~0x2u;
    seL4_CapRights.words[0] |= (v32 << 1) & 0x2u;
    return seL4_CapRights;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 PURE
seL4_CapRights_ptr_get_capAllowRead(seL4_CapRights_t *seL4_CapRights_ptr) {
    seL4_Uint32 ret;
    ret = (seL4_CapRights_ptr->words[0] & 0x2u) >> 1;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC void
seL4_CapRights_ptr_set_capAllowRead(seL4_CapRights_t *seL4_CapRights_ptr, seL4_Uint32 v32) {
    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0x2 >> 1) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));
    seL4_CapRights_ptr->words[0] &= ~0x2u;
    seL4_CapRights_ptr->words[0] |= (v32 << 1) & 0x2;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 CONST
seL4_CapRights_get_capAllowWrite(seL4_CapRights_t seL4_CapRights) {
    seL4_Uint32 ret;
    ret = (seL4_CapRights.words[0] & 0x1u) >> 0;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC seL4_CapRights_t CONST
seL4_CapRights_set_capAllowWrite(seL4_CapRights_t seL4_CapRights, seL4_Uint32 v32) {
    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0x1 >> 0 ) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));
    seL4_CapRights.words[0] &= ~0x1u;
    seL4_CapRights.words[0] |= (v32 << 0) & 0x1u;
    return seL4_CapRights;
}

LIBSEL4_INLINE_FUNC seL4_Uint32 PURE
seL4_CapRights_ptr_get_capAllowWrite(seL4_CapRights_t *seL4_CapRights_ptr) {
    seL4_Uint32 ret;
    ret = (seL4_CapRights_ptr->words[0] & 0x1u) >> 0;
    /* Possibly sign extend */
    if (0 && (ret & (1u << (31)))) {
        ret |= 0x0;
    }
    return ret;
}

LIBSEL4_INLINE_FUNC void
seL4_CapRights_ptr_set_capAllowWrite(seL4_CapRights_t *seL4_CapRights_ptr, seL4_Uint32 v32) {
    /* fail if user has passed bits that we will override */
    seL4_DebugAssert((((~0x1 >> 0) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0));
    seL4_CapRights_ptr->words[0] &= ~0x1u;
    seL4_CapRights_ptr->words[0] |= (v32 << 0) & 0x1;
}

#endif
