set(srcs "main.c"
        "board.c")

idf_component_register(SRCS "http.c" "${srcs}"
                    INCLUDE_DIRS  ".")
