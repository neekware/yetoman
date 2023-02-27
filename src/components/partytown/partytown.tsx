import {
  partytownSnippet,
  type PartytownConfig,
} from "@builder.io/partytown/integration";
import { Anything } from "~/common/common";

/**
 * Props for `<QwikPartytown/>`, which extends the Partytown Config.
 *
 * https://github.com/BuilderIO/partytown#config
 *
 * @public
 */
export interface PartytownProps extends PartytownConfig {}

/**
 * @public
 * You can pass setting with props
 */
export const QwikPartytown = (props: PartytownProps): Anything => {
  return <script dangerouslySetInnerHTML={partytownSnippet(props)} />;
};
