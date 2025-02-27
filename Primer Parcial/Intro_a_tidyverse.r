data(mpg)

library("tidyverse")

mpg

mpg %>% #pipe operardor "luego"
    add_row(manufacturer = "jeep",
            displ = 2,
            year  = 2008,
            cyl   = 4,
            trans = "manual(m6)",
            cty = 15,
            hwy = 24,
            fl = "p",
            class = "suv"
            )

mpg

mpg %>% 
    mutate(
        cty = cty * 1.609 / 3.785,
        hwy = hwy * 1.609 / 3.785,
        manufacturer = as_factor(manufacturer),
        model = as_factor(model),
    
        )

mpg_editada <- mpg  %>% # Convierte las columnas que son caracter a factores mutate IF
    mutate_if(
    .predicate = is.character,
    .funs = as_factor
    
    )
mpg_editada

mpg_editada2 <- mpg  %>% 
    mutate_if(
    .predicate = is.character,
    .funs = as_factor
    ) %>% 
    mutate(trans = fct_lump_min(trans, 20,
                               other_level = "Otros"))
mpg_editada2

mpg_editada2  %>% 
    ggplot() +
    geom_point(mapping = aes(x = displ, y = hwy))

mpg_editada2  %>% 
    ggplot(mapping = aes(x = displ, y = hwy)) +
    geom_line()

mpg_editada2  %>% 
ggplot() + 
    geom_point(mapping = aes(x = displ,
                             y = hwy,
                             color = class)
              )



ggplot(data = mpg_editada2) +
    geom_point(mapping = aes(x = displ,
                             y = hwy, 
                             color = class,
                             shape = drv,
                             size = cyl),
              alpha = 0.7)

install.packages("patchwork")

mpg_editada2  %>% 
    ggplot(aes(x = manufacturer, y = displ)) + 
    geom_boxplot()





install.packages("tidyverts")

library(tsibble)

data(world_bank_pop, package = "tidyr")
pop <- world_bank_pop

pop_tidy <- pop
#i）
#ii）
pivot_longer (cols = -c(country, indicator),
              names_to = "year", values _to = "value")
용>용
pivot_wider (names_from = indicator,
             values_from = value) 8>%
# iii)
select (country, year, contains ("TOTL")) 82%
# iv)
rename (urban_pop = SP. URB. TOTL, total_pop = SP. POP. TOTL) $>%
#V)
mutate (rural_pop_pct = (1 - urban_pop / total_pop)*100,
        country = as_factor (country),
        year = as. integer (year)
) 용>용
# vi)
filter (country %in% c("MEX", "BRA", "ARG")) $>% #vii)
as_tsibble(key = country, index = year)
pop_tidy

