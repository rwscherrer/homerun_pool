<header>
<tr>
<h1>
  Create your team<br>
  <small>Drag 9 players to their player box and click Save My Team:</small>
</h1>
 </tr>
 <div class="form-group">
 </div>
<b>Enter A Name For Your Team <b> <%=  text_field_tag :team_name,  @team.team_name %>
</header>
<style>

#div1, #div2, #div3, #div4, #div5, #div6, #div7, #div8, #div9 {
    width: 300px;
    height: 25px;
    padding: 1px;
    border: 1px solid #aaaaaa;
    margin-bottom: : 0px;
    background-color: #bbb;
}

</style>
<script>
function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("array", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("array");
    ev.target.appendChild(document.getElementById(data));
}
</script>
<div class="container-fluid">
 
<hr>

<table>
  <tr valign="top">
    <td>
      <div>
        <%= label_tag :player_1 %> 
        <div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
      </div

    <div>
      <%= label_tag :player_2 %>
      <div id="div2" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
    </div>

    <div>
      <%= label_tag :player_3 %>
      <div id="div3" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
    </div>

    <div>
      <%= label_tag :player_4 %>
      <div id="div4" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
    </div>

    <div>
      <%= label_tag :player_5 %>
      <div id="div5" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
    </div>

    <div>
      <%= label_tag :player_6 %>
      <div id="div6" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
    </div>

    <div>
      <%= label_tag :player_7 %>
      <div id="div7" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
    </div>

    <div>
      <%= label_tag :player_8 %>
      <div id="div8" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
    </div>

    <div>
      <%= label_tag :player_9 %>
      <div id="div9" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
    </div>
  </td>
    <td>
      <% Player.order( 'home_runs_2016 DESC' ).first(40).each do |player| %>
        <div id="drag" draggable="true" ondragstart="drag(event)">
          <b><%= player.name %></b>
          <small>
          <b>2016:</b> <%= player.home_runs_2016 %> <b>| 2017:</b> <%= player.home_runs_2017 %>
          <%= player.id %> 
          </small>
        </div>

      <% end %>
      <%= submit_tag "Save My Team", :class => 'btn btn-large btn-primary' %>
    </td>
  
  </tr>
</table>
</div>

  
