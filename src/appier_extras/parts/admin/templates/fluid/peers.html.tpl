{% extends "admin/admin.fluid.html.tpl" %}
{% block title %}Peers{% endblock %}
{% block name %}Peers{% endblock %}
{% block style %}no-padding{% endblock %}
{% block content %}
    <table class="filter no-fixed" data-no_input="1">
        <thead>
            <tr class="table-row table-header">
                <th class="text-left">Identifier</th>
                <th class="text-left">Hostname</th>
                <th class="text-left">Timestamp</th>
            </tr>
        </thead>
        <tbody class="filter-contents">
            {% for uid, peer in peers %}
                <tr class="table-row">
                    <td class="text-left">
                        <strong>{{ uid }}</strong>
                    </td>
                    <td class="text-left">{{ peer.hostname }}</td>
                    <td class="text-left">{{ peer.ping }}</td>
                </tr>
            {% endfor %}
        </tbody>
    </table>
{% endblock %}
