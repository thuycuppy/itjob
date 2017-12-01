var searchAutocompleteCompanyUrl = '/ajax/autocomplete/company';
var loadMoreCompanyUrl = '/ajax/loadmore/company';
var currentPage = 0;

$(document).ready(function() {
    $('#select2-search-company').select2({
        ajax: {
            url:  searchAutocompleteCompanyUrl,
            dataType: 'json',
            delay: 250,
            data: function (params) {
                return {
                    name: params.term
                };
            },
            processResults: function (data) {
                var modifiedData = $.map(data, function (obj) {
                    obj.text = obj.name;
                    return obj;
                });
                return {
                    results: modifiedData
                };
            }
        },
        placeholder: '<i class="fa fa-search"></i> Search keyword',
        escapeMarkup: function (markup) { return markup; },
        minimumInputLength: 1
    });

    $("#btnSearch").click(function () {
        window.location.href = "/company/" + $("#select2-search-company").val();
    });

    loadPage();
});

function loadPage() {
    $.ajax({
        type: 'GET',
        url: loadMoreCompanyUrl,
        data: {page: currentPage},
        success: function(res) {
            if (res.content.length > 0) {
                $("#companies").append(tmpl('tmpl-companies', res.content));
                currentPage++;
            }
            if (res.last) {
                $("#btnLoadMoreCompany").remove();
            }
        },
        error: function(res) {
            console.log('ERR:' + res);
        }
    });
}