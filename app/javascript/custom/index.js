import { sortTableRowsByTitle } from './sort_table_rows_by_title.js'
import { passwordConfirmation } from './password_confirmation.js'
import { editTestTitle } from './edit_test_title.js'
import { formInlineHandler } from './form_inline_handler.js'
import { setProgressBar } from "./set_progress_bar";

document.addEventListener('turbolinks:load', () => {
    I18n.locale = $('body').data('locale')

    // editTestTitle
    const adminTables = document.getElementsByClassName('admin table')

    if(adminTables) Array.prototype.forEach.call(adminTables, table => { new editTestTitle(table) })

    // formInlineHandler after errors occurred on resource edit
    const error = document.getElementsByClassName('resource-errors')[0]

    if(error) {
        const resourceId = error.dataset.resourceId

        new formInlineHandler(resourceId)
    }

    // progress bar
    const progressBar = document.getElementById('progress-bar')

    if(progressBar) new setProgressBar(progressBar)

    // passwordConfirmation
    const signUpForm = document.getElementById('new_user')

    if(signUpForm) new passwordConfirmation(signUpForm)

    // sortTableRowsByTitle
    const tablesToSort = document.getElementsByClassName('sortable-table')

    if(tablesToSort) Array.prototype.forEach.call(tablesToSort, table => { new sortTableRowsByTitle(table) })

    // populate badge_rule_values depending on badge_rule_type
    const badgeRuleType = document.getElementById('badge_rule_type')

    if(badgeRuleType) callUpdateBadgeRuleValue(badgeRuleType)
    if(badgeRuleType) badgeRuleType.addEventListener('change', () => { callUpdateBadgeRuleValue(badgeRuleType) })

    function callUpdateBadgeRuleValue(badgeRuleType) {
        const ruleType = badgeRuleType.value
        const $badge_rule_value = $("#badge_rule_value")
        const all_with_level = '2'
        let rule_values = []

        $badge_rule_value.children().remove()

        if(ruleType == all_with_level) {
            const levels = Array.from({length:11},(v,k)=>k)

            $.each(levels, function(level) {
                rule_values += '<option value="' + level + '">' + level + '</option>'
            })

            $badge_rule_value.append(rule_values)
        }else{
            $.ajax({
                url: '/admin/badges/find_rule_values',
                data: { rule: ruleType }
            }).done(function(data) {
                $.each(data, function(key, value) {
                    rule_values += '<option value="' + key+ '">' + value + '</option>'
                })

                $badge_rule_value.append(rule_values)
            });
        }
    }
})
