val read: string -> string

module Repo: sig
    type t = {
        name: string;
        description: string;
        pull_request_total_count: int;
        pull_requests: string list (* author_login list *)
    }

    val request : string -> string -> (t, [> `Msg of string]) result Lwt.t
end

type member = {
    login: string;
    name: string option;
    role: string
}
type team = {
    name: string;
    description: string option;
    members: member list
}
type organization = {
    name: string;
    description: string option;
    members: member list;
    teams: team list
}
val request : string -> string -> (organization, [> `Msg of string]) result Lwt.t