## Data generator for Amelia platform

R script to generate datasets to upload to the Amelia Platform, starting from the last school year with all data observable (2022/23), relying on the SchoolDataIT R package.

School Years to be covered are 2015/16, 2017/18, 2018/19, 2020/21, 2021/22, 2022/23.

As soon as data will be available for year 2023/24 relevant data will be loaded as well.

Before submitting data to the Platform it is necessary to provide an adequate description of all fields in each dataset. This is an operation to be performed manually and will require some time. 

#### Important: script uses version 0.2.4

This version employs version 0.2.4 of the package, which still has to be shared on CRAN.
So, please make sure to download the experimental version of the package from GitHub, e.g. using the code:
``` r
devtools::install_github("lcef97/SchoolDataIT")
```
If you want to force R not to upgrade the dependencies, use instead:
``` r
devtools::install_github("lcef97/SchoolDataIT", upgrade = "never")
```


