source("build_lesson.R")

get_stage("before_install") %>%
  add_code_step(update.packages(ask = FALSE))

get_stage("install") %>%
  add_code_step(remotes::install_deps(dependencies = TRUE)) %>%
  add_step(step_install_github("fmichonneau/checker"))

get_stage("deploy") %>%
  add_step(build_lesson()) %>%
  add_step(check_links())

if (Sys.getenv("id_rsa") != "") {
  # pkgdown documentation can be built optionally. Other example criteria:
  # - `inherits(ci(), "TravisCI")`: Only for Travis CI
  # - `ci()$is_tag()`: Only for tags, not for branches
  # - `Sys.getenv("BUILD_PKGDOWN") != ""`: If the env var "BUILD_PKGDOWN" is set
  # - `Sys.getenv("TRAVIS_EVENT_TYPE") == "cron"`: Only for Travis cron jobs
  get_stage("before_deploy") %>%
      add_step(step_setup_ssh())

    ## if there is a tag associated with the push or we are in master, the
    ## lesson gets deployed on gh-pages, and rendered by GitHub
    if (ci()$get_branch() == "master" || ci()$is_tag()) {
        get_stage("deploy") %>%
            add_step(step_push_deploy(path = "_site", branch = "gh-pages"))
    }

    ## if the branch is `tidyverse-first` the lesson gets deployed to the
    ## development branch, and will be rendered by netlify
    if (ci()$get_branch() == "tidyverse-first") {
        get_stage("deploy") %>%
          add_step(step_push_deploy(path = "_site", branch = "development"))
    }
}
