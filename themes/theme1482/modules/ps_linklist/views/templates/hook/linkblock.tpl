{foreach $linkBlocks as $linkBlock}
  {if $linkBlock.hook != displayNavFullWidth}
    <div class="{if ($linkBlock.hook == displayFooter) || ($linkBlock.hook == displayFooterAfter)} links-footer col-12 {else} links {/if}">
      {assign var=_expand_id value=10|mt_rand:100000}
      <ul id="footer_sub_menu_{$_expand_id}">
        {foreach $linkBlock.links as $link}
          <li>
            <a
              id="{$link.id}-{$linkBlock.id}"
              class="{$link.class}"
              href="{$link.url}"
              title="{$link.description}">
              {$link.title}
            </a>
          </li>
        {/foreach}
      </ul>
    </div>
  {else}
    <div id="_desktop_links" class="links nav-links">
      <ul>
        {foreach $linkBlock.links as $link}
          <li>
            <a
              id="{$link.id}-{$linkBlock.id}"
              class="{$link.class}"
              href="{$link.url}"
              title="{$link.description}">
              {$link.title}
            </a>
          </li>
        {/foreach}
      </ul>
    </div>
  {/if}
{/foreach}