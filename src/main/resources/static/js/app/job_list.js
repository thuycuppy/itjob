var searchAutocompleteJobUrl = '/ajax/autocomplete/job';
var loadMoreJobUrl = '/ajax/loadmore/job';
var currentPage = 0;

$(document).ready(function() {
    $('#select2-search-job').select2({
        ajax: {
            url:  searchAutocompleteJobUrl,
            dataType: 'json',
            delay: 250,
            data: function (params) {
                return {
                    title: params.term
                };
            },
            processResults: function (data) {
                var modifiedData = $.map(data, function (obj) {
                    obj.text = obj.title;
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
        window.location.href = "/job/" + $("#select2-search-job").val();
    });

    loadPage();
});

function loadPage() {
    $.ajax({
        type: 'GET',
        url: loadMoreJobUrl,
        data: {page: currentPage},
        success: function(res) {
            if (res.content.length > 0) {
                $("#jobs").append(tmpl('tmpl-jobs', res.content));
                currentPage++;
            }
            if (res.last) {
                $("#btnLoadMoreJob").remove();
            }
        },
        error: function(res) {
            console.log('ERR:' + res);
        }
    });
}