#' Post github_repo metadata to the data registry
#'
#' @param storage_root_id e.g.
#' @param hash e.g.
#' @param version version
#' @param repo repo
#' @param key API token from data.scrc.uk
#'
#' @family upload functions
#'
#' @export
#'
upload_github_repo <- function(storage_root_id,
                               repo,
                               hash,
                               version,
                               key) {

  repo_storeId <- new_storage_location(path = paste(repo, "repository"),
                                       hash = hash,
                                       storage_root_id = storage_root_id,
                                       key = key)

  repo_objectId <- new_object(storage_location_id = repo_storeId,
                              key = key)

  repo_codeRepoReleaseId <- new_code_repo_release(
    name = repo,
    version = version,
    website = paste0("https://github.com/", repo),
    object_id = repo_objectId,
    key = key)

  list(repo_storeId = repo_storeId,
       repo_objectId = repo_objectId,
       repo_codeRepoReleaseId = repo_codeRepoReleaseId)
}
