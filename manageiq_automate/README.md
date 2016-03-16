Resize instance
===============

PR: https://github.com/ManageIQ/manageiq/pull/6995 (needs update)

Steps:
 - start instance resize from UI
 - catch generated event by automate
 - wait for resize ready for confirm/reject
 - (auto)approve
 - ? add a hook for some request based approval process ?
