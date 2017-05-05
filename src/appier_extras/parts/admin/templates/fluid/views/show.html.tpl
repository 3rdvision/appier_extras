{% extends "admin/admin.fluid.html.tpl" %}
{% block title %}{% if is_global %}{{ model._readable(plural = True) }}{% else %}{{ entity }}{% endif %} / {{ definition.name }}{% endblock %}
{% block name %}
    {% if is_global %}
        <a href="{{ url_for('admin.show_model', model = model._under()) }}">
            {{ model._readable(plural = True) }}
        </a>
    {% else %}
        <a href="{{ url_for('admin.show_entity', model = model._under(), _id = entity._id) }}">
            {{ entity }}
        </a>
    {% endif %}
    <span>/</span>
    <span>{{ definition.name }}</span>
{% endblock %}
{% block style %}no-padding{% endblock %}
{% block buttons %}
    {{ super() }}
    <ul class="drop-down operations" data-name="Operations">
        {% for operation in target.operations() %}
            {% set operation_valid = not operation.devel or own.is_devel() %}
            {% if operation.instance and operation_valid %}
                {% if operation.parameters %}
                    <li>
                        <a class="button" data-window_open="#window-{{ operation.method }}">{{ operation.name }}</a>
                    </li>
                {% else %}
                    <li>
                        <a href="{{ url_for('admin.operation_model', model = target._under(), operation = operation.method, next = location_f) }}">{{ operation.name }}</a>
                    </li>
                {% endif %}
            {% endif %}
        {% endfor %}
    </ul>
    <div class="button button-color"
         data-link="{{ url_for('admin.show_model', model = target._under()) }}">View All</div>
{% endblock %}
{% block windows %}
    {{ super() }}
    {% for operation in target.operations() %}
        {% if operation.parameters %}
            <div id="window-{{ operation.method }}" class="window window-operation">
                <h1>{{ operation.name }}</h1>
                <form class="form" method="post" enctype="multipart/form-data"
                      action="{{ url_for('admin.operation_model', model = target._under(), operation = operation.method, is_global = '' if operation.instance else '1', next = location_f) }}">
                    {% for parameter in operation.parameters %}
                        {% set label, name, data_type = parameter[:3] %}
                        {% set default = parameter[3] if parameter|length > 3 else "" %}
                        <label>{{ label }}</label>
                        {{ tag_input_b("parameters", value = default, type = data_type) }}
                    {% endfor %}
                    <div class="window-buttons">
                        <span class="button button-cancel close-button">Cancel</span>
                        <span class="button button-confirm" data-submit="1">Confirm</span>
                    </div>
                </form>
            </div>
        {% endif %}
    {% endfor %}
{% endblock %}
{% block content %}
    <table class="filter bulk" data-no_input="1" data-size="{{ page.size }}"
           data-total="{{ page.total }}" data-pages="{{ page.count }}">
        <thead>
            <tr class="table-row table-header">
                <th class="text-left selection">
                    <input type="checkbox" class="square small" />
                </th>
                {% for name in names or target.list_names() %}
                    {% set description = target.to_description(name) %}
                    {% if name == page.sorter %}
                        <th class="text-left direction {{ page.direction }}">
                            <a href="{{ page.query(sorter = name) }}">{{ description }}</a>
                        </th>
                    {% else %}
                        <th class="text-left">
                            <a href="{{ page.query(sorter = name) }}">{{ description }}</a>
                        </th>
                    {% endif %}
                {% endfor %}
            </tr>
        </thead>
        <tbody class="filter-contents">
            {% for entity in entities %}
                <tr class="table-row" data-id="{{ entity._id }}">
                    <td class="text-left selection">
                        <input type="checkbox" class="square small" />
                    </td>
                    {% for name in names or target.list_names() %}
                        {% if loop.first %}
                            {% if acl("admin.models." + target._under()) %}
                                <td class="text-left">
                                    <a href="{{ url_for('admin.show_entity', model = target._under(), _id = entity._id) }}">
                                        {{ out(entity, name) }}
                                    </a>
                                </td>
                            {% else %}
                                <td class="text-left">{{ out(entity, name) }}</td>
                            {% endif %}
                        {% else %}
                            <td class="text-left">{{ out(entity, name) }}</td>
                        {% endif %}
                    {% endfor %}
                </tr>
            {% endfor %}
        </tbody>
    </table>
    {% if page.count > 1 %}
        {{ paging(page.index, page.count, caller = page.query) }}
    {% endif %}
{% endblock %}
