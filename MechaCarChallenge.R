library(dplyr)

# Deliverable 1
mecha.car.mpg <- read.csv("./Resources/MechaCar_mpg.csv")
mpg.model <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle +
                  ground_clearance, mecha.car.mpg)
summary(mpg.model)

# Deliverable 2
coil.psi <- read.csv("./Resources/Suspension_Coil.csv")
total_summary <- summarize(coil.psi, Mean=mean(PSI), Median=median(PSI),
                                     Variance = var(PSI), SD = sd(PSI))
lot_summary <- coil.psi %>% group_by(Manufacturing_Lot) %>%
               summarize(Mean=mean(PSI), Median=median(PSI),
                         Variance = var(PSI), SD = sd(PSI))

# Deliverable 3
# Population mean is 1500 PSI, determine if Lots 1-3 are statistically
# different from this mean
t.test(coil.psi$PSI, mu=1500)
lot1 <- subset(coil.psi, Manufacturing_Lot == 'Lot1')$PSI