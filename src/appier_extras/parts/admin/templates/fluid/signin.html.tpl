{% extends "partials/admin.simple.html.tpl" %}
{% block title %}Login{% endblock %}
{% block content %}
    <div class="login-panel">
        <h1>Login</h1>
        <h3>Sign in to continue to <strong>{{ owner.name }}</strong></h3>
        <div class="quote error">
            {{ error }}
        </div>
        <form action="{{ url_for('admin.login') }}" method="post" class="form">
            <input type="hidden" name="next" value="{{ next|default('', True) }}" />
            <div class="input">
                <input type="text" class="text-field small focus" name="username" value="{{ username }}"
                       placeholder="username" />
            </div>
            <div class="input">
                <input type="password" class="text-field small" name="password" placeholder="password" />
            </div>
            <div class="forgot">
                <a href="{{ url_for('admin.recover') }}">Forgot your password?</a>
            </div>
            <div class="buttons">
                <span class="button medium button-color button-blue" data-submit="true">Login</span>
            </div>
            <div class="new">
                <span>or</span>
                <a href="{{ url_for('admin.new_account') }}">create new account</a>
            </div>
        </form>
    </div>
    <div class="login-footer">
        Sign in with <a href="{{ url_for('admin.facebook', next = next) }}">Facebook</a>, <a href="#">Twitter</a> or <a href="#">Google</a>.
    </div>
{% endblock %}
