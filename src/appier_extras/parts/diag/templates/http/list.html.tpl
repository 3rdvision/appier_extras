{% extends "admin/admin.fluid.html.tpl" %}
{% block title %}HTTP Diag{% endblock %}
{% block name %}HTTP Diag{% endblock %}
{% block style %}no-padding{% endblock %}
{% block content %}
    <table class="filter" data-no_input="1">
        <thead>
            <tr class="table-row table-header">
                <th class="text-left">Method</th>
                <th class="text-left">Path</th>
                <th class="text-left">Date</th>
            </tr>
        </thead>
        <tbody class="filter-contents">
            {% for request in requests %}
                <tr class="table-row">
                    <td class="text-left">
                    	<span class="tag {{ request.method|lower }}">{{ request.method }}</span>
                    </td>
                    <td class="text-left">{{ request.path }}</td>
                    <td class="text-left">{{ request.timestamp_d }}</td>
                </tr>
            {% endfor %}
        </tbody>
    </table>
{% endblock %}
