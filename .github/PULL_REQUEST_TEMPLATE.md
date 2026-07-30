<!-- markdownlint-disable-file MD013 -->
<!-- UNCOMMENT OR DELETE
> [!CAUTION]
> _BREAKING CHANGES INTRODUCED!_
> <i>ONE_LINE_SUMMARY_HERE</i>
-->

<!-- Uncomment if accurate. No penalties for using AI - just not crediting it.
PR Co-Authored-By: Claude MODEL VERSION <noreply@anthropic.com>
Refined by @git-user
-->
## Summary

- Closes #GITHUB_ISSUE_ID
- DOES_A_THING

<details><summary><i>Additional Context</i></summary>
<!-- Design decisions, rationale, known limitations. Delete if not needed. -->
INCLUDE_ADDITIONAL_CONTEXT_HERE_IF_NOT_IN_LINKED_TICKETS
</details>

### Impact & Key Changes
<!-- Bulleted list of key files modified and the specific logic added/altered. Include why if not covered in the linked ticket. Be concise - Files Changed is source of truth. -->

- FILE ADDED_OR_MODIFIED to DO_A_THING (CONCISE_REASON_IF_NOT_COVERED_ALREADY)

### Secondary improvements
<!-- For any unrelated tech debt, style fixes, or small refactors made while working on the main task. Delete if unused. -->

- STYLE_FIX
- REFACTORED_CODE
- TECH_DEBT_ELIMINATED

## Verification / Testing

<!-- If any of the checkboxes below do not apply, MOVE them into the following details box to show that you considered it and ruled it out. -->
<details><summary><i>==== N/A items ====</i></summary>

</details><i>==== End N/A items ====</i>

<!-- TODO
- [ ] Code follows standards outlined in CONTRIBUTING.md
- [ ] `pre-commit` and `commit-msg` hooks passed locally
-->
- [ ] AI-attribution footers included when AI was used (e.g., `Co-Authored-By: Claude MODEL VERSION <EMAIL>` on commits/PRs)
- [ ] `ansible-lint` passes locally (see `docs/development.md`)
- [ ] `markdownlint-cli2` passes locally (see `docs/development.md`)
- [ ] NEW_OR_UPDATED `molecule -c .config/molecule/config.yml test -s SCENARIO` scenarios pass

    <details><summary>Evidence</summary>

    PASTE_MOLECULE_OUTPUT_OR_SUMMARY

    </details>

- [ ] (Regression) Related `molecule -c .config/molecule/config.yml test -s SCENARIO` scenarios pass

    <details><summary>Evidence</summary>

    PASTE_MOLECULE_OUTPUT_OR_SUMMARY

    </details>

- [ ] New / changed tasks are tagged appropriately (e.g., role name + subcommand)

<!-- Optional: copy/paste this block for any manual verification not covered by
     automation (cross-distro spot checks, host-side effects, external service
     checks, etc.) -->
- [ ] MANUAL_TEST_TITLE
    <details>

    DESCRIBE_TEST_STEPS_AND_OR_ADD_SCREENSHOT

    </details>

## Documentation
<!-- Check all that apply, delete the rest and/or the check the "no updates
required" line. -->
- [ ] `CHANGELOG.md` updated with concise release note `{{ NEXT_RELEASE }}`
- [ ] `README.md` (playbook or role table row added/updated, links section maintained)
- [ ] `roles/ROLENAME/README.md` ADDED_OR_MODIFIED (variables, example playbook, dependencies)
- [ ] `roles/ROLENAME/meta/main.yml` ADDED_OR_MODIFIED (metadata, min ansible version, tags)
- [ ] `roles/ROLENAME/meta/argument_specs.yml` ADDED_OR_MODIFIED
- [ ] `docs/development.md` updated (workflow, dependencies, FAQ)
- [ ] `galaxy.yml` (`tags` and/or `version` updated to reflect scope)
- [ ] Other: DOC.md
- [ ] No documentation updates required
