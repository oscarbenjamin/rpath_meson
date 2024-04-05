cdef extern from "stdlib.h":
    void* malloc(size_t)
    void free(void*)

cdef extern from "gmp.h":
    # gmp integers
    ctypedef long mp_limb_t

    ctypedef struct __mpz_struct:
        int _mp_alloc
        int _mp_size
        mp_limb_t* _mp_d

    ctypedef __mpz_struct mpz_t[1]

    # gmp functions
    void mpz_init(mpz_t)
    void mpz_clear(mpz_t)
    void mpz_set_ui(mpz_t, unsigned long)
    void mpz_pow_ui(mpz_t, mpz_t, unsigned long)
    char* mpz_get_str(char*, int, mpz_t)


def pow1000(x):
    """Return str(x**1000)"""
    cdef unsigned long y
    cdef mpz_t z, result
    cdef char* schar
    mpz_init(z)
    mpz_init(result)

    y = x
    mpz_set_ui(z, y)
    mpz_pow_ui(result, z, 1000)
    schar = mpz_get_str(NULL, 10, result)
    sstr = str(schar)

    mpz_clear(z)
    mpz_clear(result)
    free(schar)

    return sstr
