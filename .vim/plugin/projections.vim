
let g:projectionist_heuristics = {
  \ "*/package.json": {
    \"*/state.js": {
      \ "alternate": "{}/reducer.js",
      \ "type": "state"
    \},
    \"*/reducer.js": {
      \ "alternate": "{}/selectors.js",
      \ "type": "reducer"
    \},
    \"*/selectors.js": {
      \ "alternate": "{}/actions.js",
      \ "type": "selectors"
    \},
    \"*/actions.js": {
      \ "alternate": "{}/state.js",
      \ "type": "actions"
    \},
    \ "*.js": {
      \ "alternate": "{}.test.js",
      \ "type": "test"
    \},
  \}
\}
